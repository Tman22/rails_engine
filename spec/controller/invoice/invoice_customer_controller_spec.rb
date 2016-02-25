require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomerController, type: :controller do
  fixtures :invoices, :customers

  describe "#index" do
   it "responds with a customer for that invoice" do
      get :index, format: :json, invoice_id: 1
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq 'Taylor'
    end
  end
end
