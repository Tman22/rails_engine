require 'rails_helper'

RSpec.describe Api::V1::Merchants::PendingController, type: :controller do
  fixtures :merchants

  describe "#index" do
    it "tests pending items" do
      merchant = merchants(:one)
      get :index, merchant_id: merchant.id, format: :json

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first['first_name']).to eq 'Taylor'
    end
  end
end
