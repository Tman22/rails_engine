require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  fixtures :transactions

  describe "#index" do
   it "responds with all transactions" do
     get :index, format: :json
     transactions = JSON.parse(response.body)

     expect(response).to be_success
     expect(transactions.first['result']).to eq 'Ready'
     expect(transactions.last['result']).to eq 'Cancelled'
    end
  end

  describe "#show" do
    it "responds with a transaction" do
      transaction = transactions(:one)
      get :show, id: transaction.id, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
    end
  end
end
