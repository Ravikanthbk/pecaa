class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end 
  
  def after_sign_in_path_for(resource_or_scope)
    "/users"
  end

end

  