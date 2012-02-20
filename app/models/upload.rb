class Upload < ActiveRecord::Base
  has_attached_file :upload,
                    :whiny => false,
                    :styles => { :medium => "300x300",
                                 :thumb  => "150x150" }

end
