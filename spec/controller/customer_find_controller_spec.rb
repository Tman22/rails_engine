require 'rails_helper'

RSpec.describe Api::V1::Customers::FindController, type: :controller do
  fixtures :customers

  describe "#show" do
    it "responds with a customer by id" do
      customer = customers(:one)
      get :show, id: customer.id, format: :json
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq 'Taylor'
      expect(customer['last_name']).to eq 'Moore'
    end

    it "responds with a customer by first_name" do
      customer = customers(:one)
      get :show, first_name: customer.first_name, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq 'Taylor'
      expect(customer['last_name']).to eq 'Moore'
    end

    it "responds with a customer by last_name" do
      customer = customers(:one)
      get :show, last_name: customer.last_name, format: :json
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq 'Moore'
      expect(customer['first_name']).to eq 'Taylor'
    end

    it "responds with a customer by created_at" do
      customer = customers(:one)
      get :show, created_at: customer.created_at, format: :json
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq 'Moore'
      expect(customer['first_name']).to eq 'Taylor'
    end

    it "responds with a customer by updated_at" do
      customer = customers(:one)
      get :show, updated_at: customer.updated_at, format: :json
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq 'Moore'
      expect(customer['first_name']).to eq 'Taylor'
    end
  end

  describe "#index" do
    it "responds with all customers with first_name" do
      customer = customers(:one)
      get :index, first_name: customer.first_name, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 2
      expect(customers.first['last_name']).to eq 'Moore'
      expect(customers.last['last_name']).to eq 'Swift'
    end

    it "responds with all customers with last_name" do
      customer = customers(:one)
      get :index, last_name: customer.last_name, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 1
      expect(customers.first['last_name']).to eq 'Moore'
    end

    it "responds with all customers with created_at" do
      customer = customers(:one)
      get :index, created_at: customer.created_at, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 2
      expect(customers.first['last_name']).to eq 'Moore'
    end

    it "responds with all customers with updated_at" do
      customer = customers(:one)
      get :index, updated_at: customer.updated_at, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 2
      expect(customers.first['last_name']).to eq 'Moore'
    end
  end
end
