require 'rails_helper'

RSpec.describe "ItemDetails", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/item_detail/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/item_detail/new"
      expect(response).to have_http_status(:success)
    end
  end

end
