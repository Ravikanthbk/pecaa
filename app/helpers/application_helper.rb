module ApplicationHelper

  def check_selected(sym)
     @symbol == sym ? 'class=select' : ''
     sym == 'Content_Library' ? 'class=select' : ''
  end
  
end
