class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
    @subtitle = @page.title
  end
end
