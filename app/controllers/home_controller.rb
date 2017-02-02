class HomeController < ApplicationController

  def index
    @items = Flickr::Recent.new.items
  end

end
