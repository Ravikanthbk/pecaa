class SubPermissionsController < ApplicationController
  # GET /sub_permissions
  # GET /sub_permissions.json
  layout 'pecaa_application'
  def index
    @sub_permissions = SubPermission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sub_permissions }
    end
  end

  # GET /sub_permissions/1
  # GET /sub_permissions/1.json
  def show
    @sub_permission = SubPermission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub_permission }
    end
  end

  # GET /sub_permissions/new
  # GET /sub_permissions/new.json
  def new
    @sub_permission = SubPermission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub_permission }
    end
  end

  # GET /sub_permissions/1/edit
  def edit
    @sub_permission = SubPermission.find(params[:id])
  end

  # POST /sub_permissions
  # POST /sub_permissions.json
  def create
    @sub_permission = SubPermission.new(params[:sub_permission])

    respond_to do |format|
      if @sub_permission.save
        format.html { redirect_to @sub_permission, notice: 'Sub permission was successfully created.' }
        format.json { render json: @sub_permission, status: :created, location: @sub_permission }
      else
        format.html { render action: "new" }
        format.json { render json: @sub_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sub_permissions/1
  # PUT /sub_permissions/1.json
  def update
    @sub_permission = SubPermission.find(params[:id])

    respond_to do |format|
      if @sub_permission.update_attributes(params[:sub_permission])
        format.html { redirect_to @sub_permission, notice: 'Sub permission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_permissions/1
  # DELETE /sub_permissions/1.json
  def destroy
    @sub_permission = SubPermission.find(params[:id])
    @sub_permission.destroy

    respond_to do |format|
      format.html { redirect_to sub_permissions_url }
      format.json { head :ok }
    end
  end
end
