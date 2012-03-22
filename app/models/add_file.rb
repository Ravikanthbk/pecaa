class AddFile < ActiveRecord::Base
  belongs_to :user
  has_one :content_library, :as => :source
  has_attached_file :upload
#                    :whiny => false,
#                    :styles => { :medium => "300x300",
#                                 :thumb  => "150x150" }

#validates_attachment_presence :upload
#validates_attachment_size :upload, :less_than=>10.megabyte
#validates_attachment_content_type :upload, :content_type=>['application/pdf', 
#  'application/doc', 'application/docx', 'application/xls',
#  'application/xlsx', 'application/ppt', 'application/pptx', 
#  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
#  'application/vnd.ms-excel',
#  'application/vnd.ms-powerpoint']
end
