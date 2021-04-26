require 'rails_helper'

RSpec.describe 'Shippings', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/shipping/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/shipping/new'
      expect(response).to have_http_status(:success)
    end
  end
end
