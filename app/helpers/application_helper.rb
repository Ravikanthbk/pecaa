module ApplicationHelper

  def check_selected(sym)
     params[:controller] == sym ? 'class=select' : ''
  end
  
end
