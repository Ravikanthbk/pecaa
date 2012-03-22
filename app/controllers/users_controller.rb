class UsersController < ApplicationController
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update,:dashboard,:search]
  
  before_filter :check_permissions, :only => [:new, :cancel]
  skip_before_filter :require_no_authentication
  
  layout 'pecaa_application'
  before_filter :setup
    
  def check_permissions
    authorize! :create, User
  end

  
  # GET /users
  # GET /users.xml                                                
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    if params[:query].blank? && params[:date_added].blank?
      @users= User.all
    elsif !params[:query].blank? && params[:date_added].blank?
      @users= User.where("#{params[:search_on]} like ?", "%#{params[:query]}%")
    elsif params[:query].blank? && !params[:date_added].blank?
      @users= User.where(:created_at => (Date.strptime(params[:start_date],"%m-%d-%Y")..Date.strptime(params[:end_date],"%m-%d-%Y")))
    end
    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
      format.html
    end
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
    params[:user][:addresses]=[params[:user][:addresses1]] << params[:user][:addresses2]
    params[:user].delete(:addresses1)
    params[:user].delete(:addresses2)
    params[:user][:role_ids] = params[:users][:role_ids] if params[:users]
    @user_obj = User.new(params[:user])
    @user_obj.created_by = current_user
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
  
  def update
    @user_obj = User.find(params[:id])
    params[:user][:addresses]=[params[:user][:addresses1]] << params[:user][:addresses2]
    params[:user].delete(:addresses1)
    params[:user].delete(:addresses2)
    params[:user][:role_ids] = params[:users][:role_ids] if params[:users]
    params[:user][:password] = @user_obj.password
    if @user_obj.update_attributes(params[:user])
      respond_to do |format|
        format.json { render :json => @user_obj.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def dashboard
    if current_user.launch_link
      redirect_to(current_user.launch_link) 
    else
	    render :layout=>false
    end
  end
  
  def search
    @search_link_account = User.where("username like ?", "%#{params[:query]}%")
    render :partial=>"sites/search_link_account"
  end
  
  protected  
  
  def setup
    @symbol = "Users"
  end
  
end
