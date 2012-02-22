class Users::UsersController < ApplicationController
  # ====================
  # = @author = Rajesh =
  # ====================
  
  # Filter on the way
  #Just getting Started
  layout "listing"
  
  def index
    @users= User.all
  end

end
