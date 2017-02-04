module Flickr
  class Base
    def initialize
      #TODO
    end

    # url_s : Square
    # url_q : Large Square
    # url_t : Thumbnail
    # url_m : Small
    # url_n : Small 320
    # url   : Medium
    # url_z : Medium 640
    # url_c : Medium 800
    # url_b : Large
    # url_o : Original

    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    #	or
    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_[mstzb].jpg
    #	or
    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{o-secret}_o.(jpg|gif|png)

    def info(item)
      {
        url: "https://farm#{item.farm}.staticflickr.com/#{item.server}/#{item.id}_#{item.secret}_n.jpg",
        target: "https://www.flickr.com/photos/#{item.owner}/#{item.id}",
        title: "#{item.title}"
      }
    end

  end
end
