require 'rails_helper'

RSpec.describe Api::V1::Items::FindController, type: :controller do
  fixtures :items

  describe "#show" do
    it "responds with a item by id" do
      item = items(:one)
      get :show, id: item.id, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end

    it "responds with a item by name" do
      item = items(:one)
      get :show, name: item.name, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end

    it "responds with a item by unit_price" do
      item = items(:one)
      get :show, unit_price: item.unit_price, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end

    it "responds with a item by created_at" do
      item = items(:one)
      get :show, created_at: item.created_at, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end

    it "responds with a item by updated_at" do
      item = items(:one)
      get :show, updated_at: item.updated_at, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end

    it "responds with a item by merchant_id" do
      item = items(:one)
      get :show, merchant_id: item.merchant_id, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq 'Bruce'
      expect(item['description']).to eq 'Darkness'
    end
  end

  describe "#index" do
    it "responds with all items with name" do
      item = items(:one)
      get :index, name: item.name, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.first['name']).to eq 'Bruce'
      expect(items.last['description']).to eq 'Batman'
    end

    it "responds with all items with description" do
      item = items(:one)
      get :index, description: item.description, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 1
      expect(items.first['name']).to eq 'Bruce'
    end

    it "responds with all items with created_at" do
      item = items(:one)
      get :index, created_at: item.created_at, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.first['description']).to eq 'Darkness'
    end

    it "responds with all items with updated_at" do
      item = items(:one)
      get :index, updated_at: item.updated_at, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.last['description']).to eq 'Batman'
    end

    it "responds with all items with merchant_id" do
      item = items(:one)
      get :index, merchant_id: item.merchant_id, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.last['description']).to eq 'Batman'
    end
  end
end
