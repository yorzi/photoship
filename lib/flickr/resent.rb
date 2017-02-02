module Flickr
  class Recent < Base
    attr_reader :list

    def initialize
      @list = Rails.cache.fetch "recent_photos", expires_in: 10.minutes do
        flickr.photos.getRecent
      end
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
      results
    end
  end
end
