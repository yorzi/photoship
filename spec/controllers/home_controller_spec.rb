require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:flickr_recent) { instance_double(Flickr::Recent) }

  describe "GET index" do

    it "assigns @items" do
      # need to mock or stub external invokes
      items = ["https://farm1.staticflickr.com/448/31815166784_eeb9f4650f_n.jpg"]
      expect(Flickr::Recent).to receive(:new).and_return(flickr_recent)
      expect(flickr_recent).to receive(:items).and_return(items)

      get :index
      expect(assigns(:items)).to eq(items)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
