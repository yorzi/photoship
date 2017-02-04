module Flickr
  class Recent < Base
    attr_reader :list

    def initialize(options={})
      @list = Rails.cache.fetch "recent_photos_page##{options[:page]}", expires_in: 2.minutes do
        flickr.photos.getRecent(options)
      end
    end

    def items
      results = []
      list.each do |item|
        begin
          results << info(item)
        rescue
          Rails.logger.info "Item(#{item.id}) is not accessable."
          next
        end
      end
      results
    end
  end
end
