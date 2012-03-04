# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Role.delete_all
User.delete_all

role = Role.create(:name=>"SuperAdmin",:display_name=>"System Administrator")
role2 = Role.create(:name=>"Administrator",:display_name=>"Administrator")
role3 = Role.create(:name=>"WebsiteBuilder",:display_name=>"Website Builder")
user_role = Role.create(:name=>"user",:display_name=>"Normal User")

(admin = User.create(:email=>"admin-pecaa@gmail.com",:username=>"admin-pecaa",:password=>"pecaa123")).roles = [role]
20.times do |i|
  u = User.create(:email=>"test#{i}@gmail.com",:username=>"test#{i}", :password=>"test#{i}")
  u.roles = [user_role]
end

site= Site.create(:name=>"Test", :description=>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                  Duis sodales pulvinar felis ut placerat. Sed nisi sem, tristique ac suscipit eget,
                                  consequat nec mauris. Nam non tellus ante, aliquet euismod lacus. Sed rutrum justo 
                                  ac orci molestie nec venenatis purus vehicula. Quisque sodales diam in turpis semper sodales. 
                                  Integer condimentum ornare tempus. Nam odio neque, imperdiet ut adipiscing a, interdum in turpis. 
                                  Donec sollicitudin nulla nec lorem convallis vitae commodo nisl ornare. Pellentesque in scelerisque turpis.",
                                  :created_by => admin, 
                                  :is_active => true, 
                                  :title=>'Test')
                                  
SiteLink.create(:name=>"Home", :description=>'Some text',:created_by => admin, :is_active => true, :title=>'Home', :target=>"www.google.com", :site_id=>site)
SiteLink.create(:name=>"About Us", :description=>'Some text',:created_by => admin, :is_active => true, :title=>'About Us', :target=>"www.google.com", :site_id=>site)