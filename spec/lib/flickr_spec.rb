require 'rails_helper'
require 'ostruct'

RSpec.describe Flickr do
  let!(:item) do
    OpenStruct.new({
      id: "31850055034",
      owner: "138251323@N06",
      secret: "b37e3f59ef",
      server: "324",
      farm: 1,
      title: "_DSC6806",
      ispublic: 1,
      isfriend: 0,
      isfamily: 0
    })
  end

  before { Rails.cache.clear }

  describe "::Base" do
    it "generates flickr url" do
      flickr = Flickr::Base.new
      info = {
        url: "https://farm#{item.farm}.staticflickr.com/#{item.server}/#{item.id}_#{item.secret}_n.jpg",
        target: "https://www.flickr.com/photos/#{item.owner}/#{item.id}",
        title: "#{item.title}"
      }
      expect(flickr.info(item)).to eq(info)
    end
  end

  describe "::Recent" do
    it "has list instance variable" do
      flickr = Flickr::Recent.new({per_page: 5, page: 1})
      expect(flickr.list.size).to eq(5)
    end

    it "fetchs list from cache" do
      flickr = Flickr::Recent.new({per_page: 5, page: 1})
      expect(flickr.list.size).to eq(5)
      flickr2 = Flickr::Recent.new({page: 1})
      expect(Rails.cache.fetch("recent_photos_page#1")).to eq(flickr2.list)
    end

    it "returns a list of items" do
      flickr = Flickr::Recent.new({per_page: 1, page: 1})
      allow(flickr).to receive(:list).and_return([item])
      expect(flickr.items).to eq [flickr.info(item)]
    end

  end

  describe "::Search" do
    it "has list instance variable" do
      flickr = Flickr::Search.new({text: 'spring', per_page: 5, page: 1})
      expect(flickr.list.size).to eq(5)
    end

    it "fetchs list from cache" do
      flickr = Flickr::Search.new({text: 'spring', per_page: 5, page: 1})
      expect(flickr.list.size).to eq(5)
      flickr2 = Flickr::Search.new({text: 'spring', page: 1})
      expect(Rails.cache.fetch("searched_photos_spring#1")).to eq(flickr2.list)
    end

    it "returns a list of items" do
      flickr = Flickr::Search.new({text: 'spring', per_page: 1, page: 1})
      allow(flickr).to receive(:list).and_return([item])
      expect(flickr.items).to eq [flickr.info(item)]
    end
  end

end
