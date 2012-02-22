# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Role.delete_all
User.delete_all

role = Role.create(:name=>"admin")
user_role = Role.create(:name=>"user")
User.create(:email=>"admin-pecaa@gmail.com",:username=>"admin-pecaa",:password=>"pecaa123",:role=>role).roles = [role]
20.times do |i|
  u = User.create(:email=>"test#{i}@gmail.com",:username=>"test#{i}", :password=>"test#{i}",:role=>user_role)
  u.roles = [user_role]
end
