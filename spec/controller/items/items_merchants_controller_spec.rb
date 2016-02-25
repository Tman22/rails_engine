require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantController, type: :controller do
  fixtures :items, :merchants

  describe "#show" do
   it "responds with a merchant for that item" do
      get :show, format: :json, item_id: 1
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
      expect(merchant['id']).to eq 1
    end
  end
end
