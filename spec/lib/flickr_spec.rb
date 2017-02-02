require 'rails_helper'

RSpec.describe Flickr do
  let(:flickr_base) { instance_double(Flickr::Base) }
  let(:flickr_recent) { instance_double(Flickr::Recent) }
  let(:flickr_search) { instance_double(Flickr::Search) }

  before { Rails.cache.clear }

  describe "::Base" do
    it "generates flickr url" do
      pending
    end
  end

  describe "::Recent" do
    it "has list instance variable" do
      pending
    end

    it "#new - does call flickr api once" do
      pending
    end

    it "fetchs list from cache" do
      pending
    end

    it "returns a list of items" do
      pending
    end

  end

  describe "::Search" do
    it "returns a list of searched items" do
      pending
    end
  end

end
