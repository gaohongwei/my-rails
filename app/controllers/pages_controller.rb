class PagesController < ApplicationController


  def index; show; end
  def show; show_file; end

  private

  def show_file
    page = params[:id] || 'home'
    render "pages/#{page}"
  end
end
