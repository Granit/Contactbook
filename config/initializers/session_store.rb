# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
=begin
ActionController::Base.session = {
  :key         => '_simpleblog_session',
  :secret      => '702dcd7af9c2c1574b638fca9f0ae9deb4518cffa0be7537e41930b052d3805272449588cceb99472db00051db7c89f8161ca6937c5f483700783fefacda62b3'
}
=end
Simpleblog::Application.config.session_store :cookie_store, :key => '_blog_session'
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
