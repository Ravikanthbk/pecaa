class SiteLinksController < ApplicationController
  # GET /site_links
  # GET /site_links.json
  before_filter :setup
  layout 'pecaa_application'
  
  def index
    @site_links = @site.site_links.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @site_links }
    end
  end

  # GET /site_links/1
  # GET /site_links/1.json
  def show
    @site_link = @site.site_links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @site_link }
    end
  end

  # GET /site_links/new
  # GET /site_links/new.json
  def new
    @site_link = SiteLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @site_link }
    end
  end

  # GET /site_links/1/edit
  def edit
    @site_link = SiteLink.find(params[:id])
  end

  # POST /site_links
  # POST /site_links.json
  def create
    @site_link = SiteLink.new(params[:site_link])
    @site_link.site = @site
    @site_link.created_by = current_user
    
    respond_to do |format|
      if @site_link.save
        format.html { redirect_to site_site_link_path(@site, @site_link), :notice => 'Site link was successfully created.' }
        format.json { render :json => @site_link, :status => :created, :location => @site_link }
      else
        format.html { render :action => "new" }
        format.json { render :json => @site_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_links/1
  # PUT /site_links/1.json
  def update
    @site_link = SiteLink.find(params[:id])

    respond_to do |format|
      if @site_link.update_attributes(params[:site_link])
        format.html { redirect_to site_site_link_path(@site, @site_link), :notice => 'Site link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @site_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_links/1
  # DELETE /site_links/1.json
  def destroy
    @site_link = SiteLink.find(params[:id])
    @site_link.destroy

    respond_to do |format|
      format.html { redirect_to site_site_links_path(@site) }
      format.json { head :ok }
    end
  end
  def search
    if params[:query].blank? && params[:date_added].blank?
      @site_links = @site.site_links.all
    elsif !params[:query].blank? && params[:date_added].blank?
      @site_links = @site.site_links.where("#{params[:search_on]} like ?", "%#{params[:query]}%")
    elsif params[:query].blank? && !params[:date_added].blank?
      @site_links = @site.site_links.where(:created_at => (Date.strptime(params[:start_date],"%m-%d-%Y")..Date.strptime(params[:end_date],"%m-%d-%Y")))
    end
    render :action => 'index'
  end
  
  
  protected
  
  def setup
    @site = Site.find(params[:site_id] || params[:id]) 
    @symbol = "Website_List"
  end
end
