class UploadsController < ApplicationController
  layout 'pecaa_application', :except => [:new]
  def index
    @uploads = Upload.order("created_at desc").page(params[:page]).per(5)
  end
  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      redirect_to uploads_path
    else
      respond_to do |format|
        format.html  { render(:nothing => true)}
      end
    end
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to @upload
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to(uploads_url) }
      format.xml  { head :ok }
    end
  end
end
