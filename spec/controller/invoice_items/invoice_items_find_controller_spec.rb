require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindController, type: :controller do
  fixtures :invoice_items

  describe "#index" do
   it "responds with invoice_items by id" do
     get :index, id: 1, format: :json
     invoice_items = JSON.parse(response.body)

     expect(response).to be_success
     expect(invoice_items.first['quantity']).to eq 3
    end

    it "responds with invoice_items by quantity" do
      get :index, quantity: 3, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['unit_price']).to eq "20002.0"
    end

    it "responds with invoice_items by item_id" do
      get :index, item_id: 1, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 3
      expect(invoice_items.last['quantity']).to eq 2
    end

    it "responds with invoice_items by invoice_id" do
      get :index, invoice_id: 1, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 3
      expect(invoice_items.count).to eq 2
    end

    it "responds with invoice_items by unit_price" do
      get :index, unit_price: "22222", format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 1
      expect(invoice_items.count).to eq 1
    end

    it "responds with invoice_items by created_at" do
      invoice_item = invoice_items(:one)
      get :index, created_at: invoice_item.created_at, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 3
      expect(invoice_items.count).to eq 2
    end

    it "responds with invoice_items by updated_at" do
      invoice_item = invoice_items(:one)
      get :index, updated_at: invoice_item.updated_at, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first['quantity']).to eq 3
      expect(invoice_items.count).to eq 2
    end

    describe "#show" do
      it "responds with invoice_item by id" do
        invoice_item = invoice_items(:one)
        get :show, id: invoice_item.id, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by quantity" do
        invoice_item = invoice_items(:one)
        get :show, quantity: invoice_item.quantity, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by item_id" do
        invoice_item = invoice_items(:two)
        get :show, item_id: invoice_item.item_id, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by invoice_id" do
        invoice_item = invoice_items(:two)
        get :show, invoice_id: invoice_item.invoice_id, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by unit_price" do
        invoice_item = invoice_items(:one)
        get :show, unit_price: invoice_item.unit_price, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by created_at" do
        invoice_item = invoice_items(:one)
        get :show, created_at: invoice_item.created_at, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

      it "responds with invoice_item by updated_at" do
        invoice_item = invoice_items(:one)
        get :show, updated_at: invoice_item.updated_at, format: :json
        invoice_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_item['quantity']).to eq 3
      end

    end
  end
end
