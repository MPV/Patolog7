class ImportsController < ApplicationController
  require 'csv'
  
  # GET /imports
  # GET /imports.xml
  def index
    @imports = Import.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.xml
  def show
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.xml
  def new
    @import = Import.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/1/edit
  def edit
    @import = Import.find(params[:id])
  end

  # POST /imports
  # POST /imports.xml
  def create
    @import = Import.new(params[:import])
    saving_import_succeeded = @import.save
    
    if saving_import_succeeded
      @parsed_file = CSV::Reader.parse(params[:import][:filename], ';')
      #logger.info("---Started importing.")
      n = 0
      @parsed_file.each do |row|
        unless n == 0 # Skip first row with headers in CSV.
          le = LogEntry.new
          le.event_type = row[0]
          le.additional_info = row[1]
          le.logged_at = DateTime.parse(row[2].gsub('.', ':'))
          le.signed_by = row[3]
          le.referral_type = row[4]
          le.referral_id = row[5]
          le.referral_year = row[6]
          le.import_id = @import.id
          #le.save
          
          et = EventType.find_or_initialize_by_code(le.event_type)
          if et.new_record?
            et.code = le.event_type # Really necessary?
            et.save
          end
          le.event_type_id = et.id
          le.save
          
          r = Referral.find_or_initialize_by_id(le.referral_id)
          if r.new_record?
            r.referral_year = le.referral_year
            r.referral_type = le.referral_type
            r.save
          end
          
          p = Person.find_or_initialize_by_signature_code(le.signed_by)
          if p.new_record?
            p.signature_code = le.signed_by # Really necessary?
            p.save
          end
          
          s = Signature.find(:first, :conditions => { :log_entry_id => le.id, :person_id => p.id })
          if s.nil?
            s = Signature.new
            s.log_entry_id = le.id
            s.person_id = p.id
            s.save
          end
        end
        n = n + 1
        GC.start if n % 50 == 0 # Start Garbage Collection to preserve memory
      end
      #logger.info("---Finished importing.")
      flash.now[:notice] = "CSV import successful. #{n} new log entries added."
    end
    
    respond_to do |format|
      if saving_import_succeeded
        flash[:notice] = 'Import was successfully created.'
        format.html { redirect_to(@import) }
        format.xml  { render :xml => @import, :status => :created, :location => @import }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imports/1
  # PUT /imports/1.xml
  def update
    @import = Import.find(params[:id])

    respond_to do |format|
      if @import.update_attributes(params[:import])
        flash[:notice] = 'Import was successfully updated.'
        format.html { redirect_to(@import) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.xml
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to(imports_url) }
      format.xml  { head :ok }
    end
  end
end
