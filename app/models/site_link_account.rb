class SiteLinkAccount < ActiveRecord::Base
    belongs_to :user
    belongs_to :site
    
    def self.save_link(params)
      unless s = SiteLinkAccount.find_by_user_id_and_site_id(params[:user_id], params[:site_id])
        s = SiteLinkAccount.new(:user_id => params[:user_id], :site_id => params[:site_id])
      end
      if params[:remove] == "true" && s
        s.destroy
      else
        s.access = params[:access]
        s.save
      end
    end
end
