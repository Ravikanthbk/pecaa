class SitesController < ApplicationController
  # GET /sites
  # GET /sites.json
  layout 'pecaa_application'
  before_filter :setup
  
  def index
    @sites = Site.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new
    @link_accounts = @site.site_link_accounts
    # 3.times do 
      @site.site_contacts.build
    # end
    respond_to do |format|
      format.html {render :layout=>"site"}
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
    @link_accounts = @site.site_link_accounts
    
    respond_to do |format|
      format.html {render :layout=>"site"}
    end
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])
    # raise params[:site_link_accounts].inspect
    @site.created_by = current_user
    respond_to do |format|
      @site.transaction do 
        if @site.save
          
          params[:site_link_accounts].split(',').uniq.each do |s|
             sla = SiteLinkAccount.create(:user_id => s.split('_')[0].to_i, :access=>s.split('_')[1], :created_by => current_user)
             @site.site_link_accounts << sla
          end
          
          format.html { redirect_to @site, :notice => 'Site was successfully created.' }
          format.json { render :json => @site, :status => :created, :location => @site }
        else
          format.html { render :action => "new", :layout=>"site" }
          format.json { render :json => @site.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])
    raise params.inspect
    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, :notice => 'Site was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit", :layout=>"site"}
        format.json { render :json => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :ok }
    end
  end
  
  def search
    if params[:query].blank? && params[:date_added].blank?
      @sites = Site.all
    elsif !params[:query].blank? && params[:date_added].blank?
      @sites = Site.where("#{params[:search_on]} like ?", "%#{params[:query]}%")
    elsif params[:query].blank? && !params[:date_added].blank?
      @sites = Site.where(:created_at => (Date.strptime(params[:start_date],"%m-%d-%Y")..Date.strptime(params[:end_date],"%m-%d-%Y")))
    end
    render :action => 'index'
  end
  
  def preview
    @site = Site.find(params[:id])
    render :layout=> false
  end
  
  def rendering_partial
    render :partial => "contact_form"
  end
  
  def site_link_account
    if SiteLinkAccount.save_link(params)
      @link_accounts = Site.find(params[:site_id]).site_link_accounts
      # raise @link_accounts.inspect
      render :partial => "link_accounts"
    end
  end

  protected

  def setup
    @symbol="Website_List"
  end
end
