module ApplicationHelper

  def check_selected(sym)
     @symbol == sym ? 'class=select' : ''
  end
  
end
