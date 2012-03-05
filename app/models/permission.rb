class Permission < ActiveRecord::Base
  has_many :sub_permissions
end
