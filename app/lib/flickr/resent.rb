module Flickr
  class Recent < Base
    attr_reader :list

    def initialize
      @list = flickr.photos.getRecent
    end

    def items
      results = []
      list.each do |item|
        begin
          results << flickr.photos.getInfo(photo_id: item.id)
        rescue
          Rails.logger.warning "Item(#{item.id}) is not accessable."
          next
        end
      end
      results
    end
  end
end
