class SearchesController < ApplicationController

  def index
    if params[:id].present?
      @search = Search.find_by(id: params[:id])
      @flickr_search = Flickr::Search.new(text: @search.keywords, per_page: 20)
    else
      @search = Search.new
      @flickr_search = Flickr::Recent.new
    end

    @items = @flickr_search.items
  end

  def create
    search = Search.new(search_params)
    if search.save
      redirect_to searches_path(id: search.id)
    else
      redirect_to searches_path
    end
  end

  private
  def search_params
    params.require(:search).permit(:keywords)
  end

end
