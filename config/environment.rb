# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mystore3::Application.initialize!

ActiveRecord::Base.include_root_in_json = true

ActionMailer::Base.smtp_settings = {
    :tls => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "GMAIL",
    :authentication => :plain,
    :user_name => "pecaa.spree",
    :password => "pecaa123"
  }