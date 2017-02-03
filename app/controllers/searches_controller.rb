class SearchesController < ApplicationController

  def index
    if params[:id].present?
      search = Search.find_by(id: params[:id])
      flickr_search = Flickr::Search.new(text: search.keywords, per_page: 20)
    else
      flickr_search = Flickr::Recent.new
    end

    @search = Search.new(keywords: search.try(:keywords))
    @items = flickr_search.items
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

end
