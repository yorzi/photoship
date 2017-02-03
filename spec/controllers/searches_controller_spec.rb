require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:flickr_recent) { instance_double(Flickr::Recent) }
  let(:flickr_search) { instance_double(Flickr::Search) }

  describe "GET index" do

    it "assigns @search with new Search object" do
      get :index

      expect(assigns(:search).keywords).to be_nil
    end

    it "assigns @search with new Search object with existing keywords filled" do
      search = create(:search)
      get :index, params: { id: search.id }

      expect(assigns(:search).keywords).to eq(search.keywords)
    end

    it "assigns @items with Flickr recent items" do
      # need to mock or stub external invokes
      items = ["https://farm1.staticflickr.com/448/31815166784_eeb9f4650f_n.jpg"]
      expect(Flickr::Recent).to receive(:new).and_return(flickr_recent)
      expect(flickr_recent).to receive(:items).and_return(items)

      get :index
      expect(assigns(:items)).to eq(items)
    end

    it "assigns @items with Flickr searched items" do
      # need to mock or stub external invokes
      search = create(:search)
      items = ["https://farm1.staticflickr.com/448/31815166784_eeb9f4650f_n.jpg"]
      expect(Flickr::Search).to receive(:new).with(text: search.keywords, per_page: 20).and_return(flickr_search)
      expect(flickr_search).to receive(:items).and_return(items)

      get :index, params: { id: search.id }
      expect(assigns(:items)).to eq(items)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
