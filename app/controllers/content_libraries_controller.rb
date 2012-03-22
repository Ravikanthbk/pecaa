class ContentLibrariesController < ApplicationController
  layout 'pecaa_application'
  # GET /content_libraries
  # GET /content_libraries.json
  def index
    @content_libraries = ContentLibrary.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @content_libraries }
    end
  end

  # GET /content_libraries/1
  # GET /content_libraries/1.json
  def show
    @content_library = ContentLibrary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @content_library }
    end
  end

  # GET /content_libraries/new
  # GET /content_libraries/new.json
  def new
    @content_library = ContentLibrary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @content_library }
    end
  end

  # GET /content_libraries/1/edit
  def edit
    @content_library = ContentLibrary.find(params[:id])
  end

  # POST /content_libraries
  # POST /content_libraries.json
  def create
    @content_library = ContentLibrary.new(params[:content_library])

    respond_to do |format|
      if @content_library.save
        format.html { redirect_to @content_library, :notice => 'Content library was successfully created.' }
        format.json { render :json => @content_library, :status => :created, :location => @content_library }
      else
        format.html { render :action => "new" }
        format.json { render :json => @content_library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_libraries/1
  # PUT /content_libraries/1.json
  def update
    @content_library = ContentLibrary.find(params[:id])

    respond_to do |format|
      if @content_library.update_attributes(params[:content_library])
        format.html { redirect_to @content_library, :notice => 'Content library was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @content_library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_libraries/1
  # DELETE /content_libraries/1.json
  def destroy
    @content_library = ContentLibrary.find(params[:id])
    @content_library.destroy

    respond_to do |format|
      format.html { redirect_to content_libraries_url }
      format.json { head :ok }
    end
  end
  
  def search
    @content_libraries = ContentLibrary.search(params[:search]).page(params[:page]).per(13)
    respond_to do |format|
      format.html { render :action => "search",:layout=>"site" }
      format.json { head :ok }
    end
  end
end
