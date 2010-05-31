class EventTypesController < ApplicationController
  # GET /event_types
  # GET /event_types.xml
  def index
    @event_types = EventType.all(:order => :position)
    @sorted_event_types = EventType.all(:conditions => "position NOT NULL", :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @event_types }
      format.json { render :json => @event_types }
    end
  end

  # GET /event_types/1
  # GET /event_types/1.xml
  def show
    @event_type = EventType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event_type }
      format.json { render :json => @event_type }
    end
  end

  # GET /event_types/new
  # GET /event_types/new.xml
  def new
    @event_type = EventType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event_type }
    end
  end

  # GET /event_types/1/edit
  def edit
    @event_type = EventType.find(params[:id])
  end

  # POST /event_types
  # POST /event_types.xml
  def create
    @event_type = EventType.new(params[:event_type])

    respond_to do |format|
      if @event_type.save
        flash[:notice] = 'EventType was successfully created.'
        format.html { redirect_to(@event_type) }
        format.xml  { render :xml => @event_type, :status => :created, :location => @event_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_types/1
  # PUT /event_types/1.xml
  def update
    @event_type = EventType.find(params[:id])

    respond_to do |format|
      if @event_type.update_attributes(params[:event_type])
        flash[:notice] = 'EventType was successfully updated.'
        format.html { redirect_to(@event_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /event_types/1
  # DELETE /event_types/1.xml
  def destroy
    @event_type = EventType.find(params[:id])
    @event_type.destroy

    respond_to do |format|
      format.html { redirect_to(event_types_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    @event_types = EventType.all
    @event_types.each do |event_type|
      event_type.position = params["event_types"].index(event_type.id.to_s)+1
      event_type.save
    end
  end
end
