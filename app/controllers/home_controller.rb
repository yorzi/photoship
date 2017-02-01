class HomeController < ApplicationController

  def index
    list = flickr.photos.getRecent
    @items = Flickr::Recent.new.items
  end

end
