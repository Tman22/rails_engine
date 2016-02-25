require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  fixtures :items, :merchants

  describe "#index" do
   it "responds with items for that merchant" do
      get :index, format: :json, merchant_id: 1
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq 'Bruce'
      expect(items.last['description']).to eq 'Batman'
      expect(items.count).to eq 2
    end
  end
end
