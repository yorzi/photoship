class SearchesController < ApplicationController
  before_action :find_items, only: [:index, :fetch_more]

  def index
    @search = Search.new(keywords: @search.try(:keywords))
  end

  def create
    search = Search.new(search_params)
    if search.save
      redirect_to root_path(id: search.id)
    else
      redirect_to root_path
    end
  end

  private
  def search_params
    params.require(:search).permit(:keywords)
  end

  def find_items
    if @search = Search.find_by(id: params[:id])
      flickr_search = Flickr::Search.new(text: @search.keywords, per_page: 100, page: params[:page] || 1)
    else
      flickr_search = Flickr::Recent.new(per_page: 100, page: params[:page] || 1)
    end
    @items = flickr_search.items
  end
end
