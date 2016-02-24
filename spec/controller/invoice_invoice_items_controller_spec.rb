require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  fixtures :invoices, :invoice_items

  describe "#index" do
   it "responds with all invoice_items of that invoice" do
     get :index, format: :json, invoice_id: 1
     invoice_items = JSON.parse(response.body)

     expect(response).to be_success
     expect(invoice_items.first['quantity']).to eq '3'
     expect(invoice_items.last['quantity']).to eq '2'
     expect(invoice_items.count).to eq 2
    end
  end
end
