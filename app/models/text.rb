class Text < ActiveRecord::Base
  belongs_to :user
  has_one :content_library, :as => :source
end
