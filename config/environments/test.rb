Simpleblog::Application.configure do
# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true

# set delivery method to :smtp, :sendmail or :test
config.action_mailer.delivery_method = :smtp

# these options are only needed if you choose smtp delivery
config.action_mailer.smtp_settings = {
  :address        => 'smtp.example.com',
  :port           => 25,
  :domain         => 'www.example.com',
  :authentication => :login,
  :user_name      => 'www',
  :password       => 'secret'
}

# Use SQL instead of Active Record's schema dumper when creating the test database.
# This is necessary if your schema can't be completely dumped by the schema dumper,
# like if you have constraints or database-specific column types
# config.active_record.schema_format = :sql

config.gem "webrat", :lib => false
config.gem "cucumber", :lib=> false
config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
end
