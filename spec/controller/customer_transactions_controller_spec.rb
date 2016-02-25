require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  fixtures :transactions, :customers

  describe "#index" do
   it "responds with transactions for that customer" do
      get :index, format: :json, customer_id: 1
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.first['result']).to eq 'Ready'
      expect(transactions.last['id']).to eq 3
    end
  end
end
