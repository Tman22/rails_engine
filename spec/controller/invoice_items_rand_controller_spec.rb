require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :controller do
  
  describe "#show" do
   it "responds with a single random invoice_item" do
     get :show, format: :json
     invoice_item = JSON.parse(response.body)

     expect(response).to be_success
     expect(invoice_item.count).to eq 1
    end
  end
end
