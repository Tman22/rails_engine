require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindController, type: :controller do
  fixtures :invoices

  describe "#show" do
    it "responds with a invoice by id" do
      invoice = invoices(:one)
      get :show, id: invoice.id, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

    it "responds with a invoice by customer_id" do
      invoice = invoices(:one)
      get :show, customer_id: invoice.customer_id, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

    it "responds with a invoice by merchant_id" do
      invoice = invoices(:one)
      get :show, merchant_id: invoice.merchant_id, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

    it "responds with a invoice by status" do
      invoice = invoices(:one)
      get :show, status: invoice.status, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

    it "responds with a invoice by created_at" do
      invoice = invoices(:one)
      get :show, created_at: invoice.created_at, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

    it "responds with a invoice by updated_at" do
      invoice = invoices(:one)
      get :show, updated_at: invoice.updated_at, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end

  end

  describe "#index" do
    it "responds with all invoices with id" do
      invoice = invoices(:one)
      get :index, id: invoice.id, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 1
      expect(invoices.first['status']).to eq 'Ready'
    end

    it "responds with all invoices with status" do
      invoice = invoices(:one)
      get :index, status: invoice.status, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 2
      expect(invoices.first['status']).to eq 'Ready'
    end

    it "responds with all invoices with customer_id" do
      invoice = invoices(:one)
      get :index, customer_id: invoice.customer_id, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 2
      expect(invoices.last['id']).to eq 2
    end

    it "responds with all invoices with merchant_id" do
      invoice = invoices(:one)
      get :index, merchant_id: invoice.merchant_id, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 2
      expect(invoices.first['id']).to eq 1
      expect(invoices.last['id']).to eq 2
    end

    it "responds with all invoices with created_at" do
      invoice = invoices(:one)
      get :index, created_at: invoice.created_at, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 2
      expect(invoices.last['id']).to eq 2
    end

    it "responds with all invoices with updated_at" do
      invoice = invoices(:one)
      get :index, updated_at: invoice.updated_at, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 2
      expect(invoices.last['id']).to eq 2
    end
  end
end
