# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Push-Queue-MongoDB_session',
  :secret      => '7fc16a154c4b3a81181c8394f83c25715be5afd2f8c455717a380d9d5ee0748e7f99d1e489cbda54a014558ebd6386f6d51cdced5cc19543cfbf8d73a4f793f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
