class Video < ActiveRecord::Base
  # Paperclip
  # http://www.thoughtbot.com/projects/paperclip
  has_attached_file :source

  # Paperclip Validations
  validates_attachment_presence :source
  validates_attachment_size :source, :less_than=>30.megabyte
  validates_attachment_content_type :source, :content_type => ['video/mp4', 'video/mpeg', 'video/flv', 'video/f4v']
#  validates_attachment_content_type :source, :content_type => 'video/quicktime'

    # Acts as State Machine
  # http://elitists.textdriven.com/svn/plugins/acts_as_state_machine
  acts_as_state_machine :initial => :pending
  state :pending
  state :converting
  state :converted, :enter => :set_new_filename
  state :error

  event :convert do
    transitions :from => :pending, :to => :converting
  end

  event :converted do
    transitions :from => :converting, :to => :converted
  end

  event :failed do
    transitions :from => :converting, :to => :error
  end

  # This method is called from the controller and takes care of the converting
  def convert
    self.convert!
    success = system(convert_command)
    if success && $?.exitstatus == 0
      self.converted!
    else
      self.failure!
    end
  end

  protected

  # This method creates the ffmpeg command that we'll be using
  def convert_command
    flv = File.join(File.dirname(source.path), "#{id}.flv")
    File.open(flv, 'w')

    command = <<-end_command
      ffmpeg -i #{ source.path } -ar 22050 -ab 32 -acodec mp3
    -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ flv }
end_command
    command.gsub!(/\s+/, " ")
  end

  # This update the stored filename with the new flash video file
  def set_new_filename
    update_attribute(:source_file_name, "#{id}.flv")
  end

#    has_attached_file :source, :styles => {
#      :medium => { :geometry => "640x480", :format => 'flv' },
#      :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
#    }, :processors => [:ffmpeg]
end
