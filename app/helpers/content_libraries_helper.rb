module ContentLibrariesHelper

  def display_content(content)
    if content.source_type == 'Image'
      image = content.source.upload.url(:medium).split('?')[0]
      "<a href=#{image} rel='facebox'><img src='images/icon-eye.png' title='View' /></a>".html_safe
    end
  end

end
