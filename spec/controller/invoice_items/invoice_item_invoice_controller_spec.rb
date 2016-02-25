require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoiceController, type: :controller do
  fixtures :invoices, :invoice_items

  describe "#index" do
   it "responds with a invoice for that invoice_item table" do
      get :index, format: :json, invoice_item_id: 1
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq 1
      expect(invoice['status']).to eq 'Ready'
    end
  end
end
