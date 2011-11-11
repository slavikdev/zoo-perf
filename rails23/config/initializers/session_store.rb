# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails23mongo_session',
  :secret      => '238455b1ac1e281f2e100033d0609367322e63c880f585949a8a5facc1ac0adc8bbf10e8feed1c1b57c581afcc5dba5185e51ffcab658e9c8bd684220e291d71'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
