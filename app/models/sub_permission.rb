class SubPermission < ActiveRecord::Base

  has_and_belongs_to_many :roles
  belongs_to :permission

  def controller_name
    name.split(" ").first.downcase
  end
end

