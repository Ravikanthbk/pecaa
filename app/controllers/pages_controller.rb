class PagesController < ApplicationController

  def index
    render :layout=>false
  end

  def new
    @page = Page.new
    render :layout=>false
  end
end
