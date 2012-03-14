class RolesController < ApplicationController
  # GET /permissions
  # GET /permissions.json
  layout 'pecaa_application'
  def index
    if params[:query].blank? && params[:date_added].blank?
      @roles= Role.all
    elsif !params[:query].blank? && params[:date_added].blank?
      @roles= Role.where("#{params[:search_on]} like ?", "%#{params[:query]}%")
    elsif params[:query].blank? && !params[:date_added].blank?
      @roles= Role.where(:created_at => (Date.strptime(params[:start_date],"%m-%d-%Y")..Date.strptime(params[:end_date],"%m-%d-%Y")))
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /permissions/new
  # GET /permissions/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /permissions/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @role = Role.new(params[:role])
    @role.sub_permission_ids = params[:roles][:sub_permission_ids] if params[:roles]
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Permission was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissions/1
  # PUT /permissions/1.json
  def update
    @role = Role.find(params[:id])
    @role.sub_permission_ids = params[:roles][:sub_permission_ids] if params[:roles]
@role.save
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to "/roles", notice: 'Permission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :ok }
    end
  end
end

