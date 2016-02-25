require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindController, type: :controller do
  fixtures :merchants

  describe "#show" do
    it "responds with a merchant by id" do
      merchant = merchants(:one)
      get :show, id: merchant.id, format: :json
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
    end

    it "responds with a merchant by name" do
      merchant = merchants(:one)
      get :show, name: merchant.name, format: :json
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
    end

    it "responds with a merchant by created_at" do
      merchant = merchants(:one)
      get :show, created_at: merchant.created_at, format: :json
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
    end

    it "responds with a merchant by updated_at" do
      merchant = merchants(:one)
      get :show, updated_at: merchant.updated_at, format: :json
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
    end
  end

  describe "#index" do
    it "responds with any merchant with that id" do
      merchant = merchants(:one)
      get :index, id: merchant.id, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.first['name']).to eq 'Tim'
    end

    it "responds with any merchant with that name" do
      merchant = merchants(:one)
      get :index, name: merchant.name, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq 2
      expect(merchants.first['name']).to eq 'Tim'
      expect(merchants.last['name']).to eq 'Tim'
    end

    it "responds with any merchant with that created_at" do
      merchant = merchants(:one)
      get :index, created_at: merchant.created_at, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq 2
      expect(merchants.first['name']).to eq 'Tim'
    end

    it "responds with any merchant with that updated_at" do
      merchant = merchants(:one)
      get :index, updated_at: merchant.updated_at, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq 2
      expect(merchants.first['name']).to eq 'Tim'
    end
  end
end
