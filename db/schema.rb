# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100527112607) do

  create_table "event_types", :force => true do |t|
    t.string   "code"
    t.string   "short_description"
    t.text     "long_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_entries", :force => true do |t|
    t.string   "event_type"
    t.string   "additional_info"
    t.datetime "logged_at"
    t.string   "signed_by"
    t.string   "referral_type"
    t.integer  "referral_id"
    t.integer  "referral_year"
    t.integer  "import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type_id"
  end

  create_table "people", :force => true do |t|
    t.string   "signature_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referrals", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "referral_year"
    t.string   "referral_type"
  end

  create_table "signatures", :force => true do |t|
    t.integer  "log_entry_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
