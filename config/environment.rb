# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mystore3::Application.initialize!

ActiveRecord::Base.include_root_in_json = true

require 'smtp_tls'

ActionMailer::Base.server_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "localhost.localdomain",
  :authentication => :plain,
  :user_name => "pecaa.spree",
  :password => "pecaa123"
}