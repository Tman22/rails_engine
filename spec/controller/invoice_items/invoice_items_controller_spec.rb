require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  fixtures :invoice_items

  describe "#index" do
   it "responds with all invoice_items" do
     get :index, format: :json
     invoice_items = JSON.parse(response.body)

     expect(response).to be_success
     expect(invoice_items.first['quantity']).to eq 3
     expect(invoice_items.last['quantity']).to eq 1
    end
  end

  describe "#show" do
   it "responds with a invoice_item" do
     invoice_item = invoice_items(:one)
     get :show, id: invoice_item.id, format: :json
     invoice_item = JSON.parse(response.body)

     expect(response).to be_success
     expect(invoice_item['quantity']).to eq 3
    end
  end

end
