class AddColumnsToSitePages < ActiveRecord::Migration
  def change
    add_column :site_pages, :target, :string
    add_column :site_pages, :link_url, :text
    add_column :site_pages, :category, :string
    add_column :site_pages, :page_layout, :string
    add_column :site_pages, :custom_title, :string
    add_column :site_pages, :description, :string
    add_column :site_pages, :keywords, :string
    add_column :site_pages, :custom_url , :string
    add_column :sites, :site_nav_type, :string
  end
end
