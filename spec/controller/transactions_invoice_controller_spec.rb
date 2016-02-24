require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoiceController, type: :controller do
  fixtures :transactions, :invoices

  describe "#index" do
   it "responds with a invoice for that transactions table" do
      get :index, format: :json, transaction_id: 1
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq 1
      expect(invoice['status']).to eq 'Ready'
    end
  end
end
