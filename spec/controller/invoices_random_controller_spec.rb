require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do

  describe "#show" do
   it "responds with a single random item" do
     get :show, format: :json
     item = JSON.parse(response.body)

     expect(response).to be_success
     expect(item.count).to eq 1
    end
  end

end
