class VideosController < ApplicationController
    layout 'pecaa_application', :except => [:new]
  def index
    @videos = Video.find :all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    Video.transaction do
      if @video.save
        @video.convert
        flash[:notice] = 'Video has been uploaded'
        redirect_to videos_path
      else
        respond_to do |format|
          format.html  { render(:nothing => true)}
        end
      end
    end
  end

  def show
    @video = Video.find(params[:id])
  end
  
end
