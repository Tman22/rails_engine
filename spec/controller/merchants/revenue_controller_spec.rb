require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenueController, type: :controller do
  fixtures :merchants

  describe "#index" do
    it "tests total revenue comes back" do
      merchant = merchants(:one)
      get :index, date: merchant.created_at, format: :json

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['total_revenue']).to eq '22222.0'
    end

    it "tests merchant gets revenue back" do
      merchant = merchants(:one)
      get :show, merchant_id: merchant.id, date: merchant.created_at, format: :json

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['revenue']).to eq '22222.0'
    end
  end

end
