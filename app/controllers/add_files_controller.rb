class AddFilesController < ApplicationController
  layout 'pecaa_application', :except => [:new, :edit, :show]
  def index
    @add_files = AddFile.order("created_at desc").page(params[:page]).per(5)
  end
  def show
    @add_file = AddFile.find(params[:id])
  end

  def new
    @add_file = AddFile.new
  end

  def create
    @add_file = AddFile.new(params[:add_file])
    @add_file.user_id = current_user
    AddFile.transaction do
      if @add_file.save
        ContentLibrary.create({:name => @add_file.upload_file_name,
          :source_id => @add_file.id, :source_type => 'File',
          :last_used => nil, :times_used => nil, :added_by => current_user.username})
        redirect_to content_libraries_path
      else
        redirect_to content_libraries_path
#        respond_to do |format|
#          format.html  { render(:nothing => true)}
#        end
      end
    end
  rescue
    redirect_to content_libraries_path
  end

  def edit
    @add_file = AddFile.find(params[:id])
  end

  def update
    @add_file = AddFile.find(params[:id])
    params[:add_file].merge!({:user_id => current_user})
    if @add_file.update_attributes(params[:add_file])
      content_library = ContentLibrary.find_by_source_id(@add_file.id)
      content_library.update_attributes({:name => @add_file.upload_file_name,
          :last_used => nil, :times_used => nil, :added_by => current_user.username})
      redirect_to content_libraries_path
      else
        redirect_to content_libraries_path
#        respond_to do |format|
#          format.html  { render(:nothing => true)}
#        end
    end
  rescue
    redirect_to content_libraries_path
  end

  def download
    download_file = AddFile.find(params[:id])
    send_file download_file.upload.url, :type => download_file.download_file
  end

  def destroy
    add_file = AddFile.find(params[:id])
    add_file.destroy
    respond_to do |format|
      format.html { redirect_to(add_files_url) }
      format.xml  { head :ok }
    end
  end
end
