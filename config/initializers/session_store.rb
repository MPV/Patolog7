# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_test1_rails_session',
  :secret      => 'caf0a60631dba9f422cb1f6e1efe4ea52259234bf3b45abad271203c625d85cce9306545bb41be484abcad2be027e98f9633cb18853d79059a454d0faeb5f9b2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
