class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :preferred_link
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to "/logout"
  end 
  
  def preferred_link
    if params[:preferred_link] == "true"
      current_user.launch_link = request.url.split('?').first
      current_user.save
    end
  end
  
end

  