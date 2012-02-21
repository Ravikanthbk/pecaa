# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


role = Role.create(:name=>"admin")
User.create(:email=>"admin-pecaa@gmail.com",:username=>"admin-pecaa",:password=>"pecaa123",:role=>role )