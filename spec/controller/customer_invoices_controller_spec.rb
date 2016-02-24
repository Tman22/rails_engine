require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  fixtures :invoices, :customers

  describe "#index" do
   it "responds with invoices for that customer" do
      get :index, format: :json, customer_id: 1
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.first['status']).to eq 'Ready'
      expect(invoices.last['id']).to eq 2
    end
  end
end
