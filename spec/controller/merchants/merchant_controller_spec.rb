require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  fixtures :merchants

  describe "#index" do
   it "responds with all merchants" do
     get :index, format: :json
     merchants = JSON.parse(response.body)

     expect(response).to be_success
     expect(response).to have_http_status(200)
     expect(merchants.first['name']).to eq 'Tim'
     expect(merchants.last['name']).to eq 'MyString'
    end
  end

  describe "#show" do
    it "responds with a merchant" do
      merchant = merchants(:one)
      get :show, id: merchant.id, format: :json
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
    end
  end
end
