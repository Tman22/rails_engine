require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  fixtures :invoices, :transactions

  describe "#index" do
   it "responds with all transactions of that invoice" do
     get :index, format: :json, invoice_id: 1 
     transactions = JSON.parse(response.body)

     expect(response).to be_success
     expect(transactions.first['result']).to eq 'Ready'
     expect(transactions.last['result']).to eq 'Cancelled'
     expect(transactions.count).to eq 2
    end
  end
end
