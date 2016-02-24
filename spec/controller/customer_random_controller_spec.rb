require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, type: :controller do
  fixtures :customers

  describe "#show" do
   it "responds with a single random customer" do
     get :show, format: :json
     customer = JSON.parse(response.body)

     expect(response).to be_success
     expect(customer.count).to eq 1
    end
  end
end
