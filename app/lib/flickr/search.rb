module Flickr
  class Search < Base
    attr_reader :list

    def initialize(options={})
      @list = Rails.cache.fetch "searched_photos_#{options[:text]}##{options[:page]}", expires_in: 10.minutes do
        flickr.photos.search(options)
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
