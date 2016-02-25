require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  fixtures :invoices, :invoice_items

  describe "#index" do
   it "responds with invoice_items for that item" do
      get :index, format: :json, item_id: 1
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 3
      expect(invoice_items.last['quantity']).to eq 2
    end
  end
end
