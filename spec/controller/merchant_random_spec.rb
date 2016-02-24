require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do
  fixtures :merchants

  describe "#show" do
   it "responds with a single merchant" do
     get :show, format: :json
     merchant = JSON.parse(response.body)

     expect(response).to be_success
     expect(merchant.count).to eq 1
    end
  end
end
