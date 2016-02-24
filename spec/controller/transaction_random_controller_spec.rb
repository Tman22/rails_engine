require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, type: :controller do

  describe "#show" do
   it "responds with a single transactions" do
     get :show, format: :json
     transactions = JSON.parse(response.body)

     expect(response).to be_success
     expect(transactions.count).to eq 1
    end
  end
end
