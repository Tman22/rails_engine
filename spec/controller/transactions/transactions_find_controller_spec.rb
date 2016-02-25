require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindController, type: :controller do
  fixtures :transactions

  describe "#show" do
    it "responds with a transaction by id" do
      transaction = transactions(:one)
      get :show, id: transaction.id, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end

    it "responds with a transaction by result" do
      transaction = transactions(:one)
      get :show, result: transaction.result, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end

    it "responds with a transaction by invoice_id" do
      transaction = transactions(:one)
      get :show, invoice_id: transaction.invoice_id, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end

    it "responds with a transaction by credit_card_number" do
      transaction = transactions(:one)
      get :show, credit_card_number: transaction.credit_card_number, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end

    it "responds with a transaction by created_at" do
      transaction = transactions(:one)
      get :show, created_at: transaction.created_at, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end

    it "responds with a transaction by updated_at" do
      transaction = transactions(:one)
      get :show, updated_at: transaction.updated_at, format: :json
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq 'Ready'
      expect(transaction['id']).to eq 1
    end
  end

  describe "#index" do
    it "responds with all transactions with id" do
      transaction = transactions(:one)
      get :index, id: transaction.id, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 1
      expect(transactions.first['result']).to eq 'Ready'
    end

    it "responds with all transactions with result" do
      transaction = transactions(:one)
      get :index, result: transaction.result, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 1
      expect(transactions.first['id']).to eq 1
    end

    it "responds with all transactions with invoice_id" do
      transaction = transactions(:one)
      get :index, invoice_id: transaction.invoice_id, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
      expect(transactions.first['result']).to eq 'Ready'
    end

    it "responds with all transactions with credit_card_number" do
      transaction = transactions(:one)
      get :index, credit_card_number: transaction.credit_card_number, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
      expect(transactions.first['result']).to eq 'Ready'
    end

    it "responds with all transactions with created_at" do
      transaction = transactions(:one)
      get :index, created_at: transaction.created_at, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
      expect(transactions.first['result']).to eq 'Ready'
    end

    it "responds with all transactions with updated_at" do
      transaction = transactions(:one)
      get :index, updated_at: transaction.updated_at, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
      expect(transactions.first['result']).to eq 'Ready'
    end
  end
end
