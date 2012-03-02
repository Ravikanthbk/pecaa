module ContentLibrariesHelper

  def display_content(content)
    if content.source_type == 'Image'
      "<a href=#{image_path(content.source_id)} rel='facebox'><img src='images/icon-eye.png' title='View' /></a>".html_safe
    elsif content.source_type == 'Video'
      "<a href=#{video_path(content.source_id)} rel='facebox'><img src='images/icon-eye.png' title='View' /></a>".html_safe
    end
  end

  def edit_content(content)
    if content.source_type == 'Image'
      "<a href=#{edit_image_path(content.source_id)} rel='facebox'><img src='images/btn-edit.png' /></a>".html_safe
    elsif content.source_type == 'Video'
      "<a href=#{edit_video_path(content.source_id)} rel='facebox'><img src='images/btn-edit.png' /></a>".html_safe
    end
  end

end
