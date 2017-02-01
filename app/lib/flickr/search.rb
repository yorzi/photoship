module Flickr
  class Search < Base
    attr_reader :list

    def initialize(options)
      @list = flickr.photos.search(options)
    end

    def items
      results = []
      list.each do |item|
        begin
          # results << flickr.photos.getInfo(photo_id: item.id)
          results << url(item)
        rescue
          Rails.logger.warning "Item(#{item.id}) is not accessable."
          next
        end
      end
      results
    end
  end
end
