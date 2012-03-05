class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :administrator
      can :manage, [User, Role, Address, Permission, SubPermission]
    elsif user.role? :website_builder
      can :manage, [Upload]
      # manage products, assets he owns
#      can :manage, Product do |product|
#        product.try(:owner) == user
#      end
#      can :manage, Asset do |asset|
#        asset.assetable.try(:owner) == user
#      end
    else
#      can :manage,[User]
    end
  end
end