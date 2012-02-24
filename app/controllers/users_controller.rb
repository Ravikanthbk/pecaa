class UsersController < ApplicationController
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
  
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
  
  layout 'pecaa_application'
 
  def check_permissions
    authorize! :create, User
  end

  
  # GET /users
  # GET /users.xml                                                
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    # @users = User.accessible_by(current_ability, :index).limit(20)
    # respond_to do |format|
    #   format.json { render :json => @users }
    #   format.xml  { render :xml => @users }
    #   format.html
    # end
    redirect_to "/users/list"
  end
 
  # GET /users/new
  # GET /users/new.xml                                            
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new
    @user_obj=User.new
    respond_to do |format|
      format.json { render :json => @user_obj }   
      format.xml  { render :xml => @user_obj }
      format.html
    end
  end
 
  # GET /users/1
  # GET /users/1.xml                                                       
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
    respond_to do |format|
      format.json { render :json => @user_obj }
      format.xml  { render :xml => @user_obj }
      format.html      
    end
  end
 
  # GET /users/1/edit                                                      
  # GET /users/1/edit.xml                                                      
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
    @user_obj = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => @user_obj }   
      format.xml  { render :xml => @user_obj }
      format.html
    end
 
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end
 
  # DELETE /users/1     
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy
    @user_obj.destroy!
 
    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }      
    end
 
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end
 
  # POST /users
  # POST /users.xml         
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user_obj = User.new(params[:user])
 
    if @user_obj.save
      respond_to do |format|
        format.json { render :json => @user_obj.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
  
end