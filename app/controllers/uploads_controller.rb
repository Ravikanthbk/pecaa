class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
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
      redirect_to @upload
    else
     # redirect_to Upload_path
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
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
end
