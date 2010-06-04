class Signature < ActiveRecord::Base
  belongs_to :log_entriy
  belongs_to :person
end
