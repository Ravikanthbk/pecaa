class VideosController < ApplicationController
    layout 'pecaa_application', :except => [:new, :edit, :show]
  def index
    @videos = Video.find :all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end
  
  def create
    @video = Video.new(params[:video])
    @video.user_id = current_user
    Video.transaction do
      if @video.save
        begin
        @video.convert
#        flash[:notice] = 'Video has been uploaded'
        ContentLibrary.create({:name => @video.source_file_name,
          :source_id => @video.id, :source_type => 'Video',
          :last_used => nil, :times_used => nil, :added_by => current_user.username})
        rescue
        end
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
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    params[:video].merge!({:user_id => current_user, :state => :pending})
    if @video.update_attributes(params[:video])
      @video.convert
      content_library = ContentLibrary.find_by_source_id(@video.id)
      content_library.update_attributes({:name => @video.source_file_name,
        :last_used => nil, :times_used => nil, :added_by => current_user.username})
      redirect_to content_libraries_path
    else
      redirect_to content_libraries_path
#      respond_to do |format|
#        format.html  { render(:nothing => true)}
#      end
    end
  rescue
    redirect_to content_libraries_path
  end

end
