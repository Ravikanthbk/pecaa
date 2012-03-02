class ImagesController < ApplicationController
  layout 'pecaa_application', :except => [:new, :edit, :show]
  def index
    @images = Image.order("created_at desc").page(params[:page]).per(5)
  end
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    @image.user_id = current_user
    Image.transaction do
      if @image.save
        ContentLibrary.create({:name => @image.upload_file_name,
          :source_id => @image.id, :source_type => 'Image',
          :last_used => nil, :times_used => nil, :added_by => current_user.username})
        redirect_to content_libraries_path
      else
        respond_to do |format|
          format.html  { render(:nothing => true)}
        end
      end
    end
  rescue
    redirect_to content_libraries_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    params[:image].merge!({:user_id => current_user})
    if @image.update_attributes(params[:image])
      content_library = ContentLibrary.find_by_source_id(@image.id)
      content_library.update_attributes({:name => @image.upload_file_name,
          :last_used => nil, :times_used => nil, :added_by => current_user.username})
      redirect_to content_libraries_path
      else
        respond_to do |format|
          format.html  { render(:nothing => true)}
        end
    end
  rescue
    redirect_to content_libraries_path
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    respond_to do |format|
      format.html { redirect_to(images_url) }
      format.xml  { head :ok }
    end
  end
end
