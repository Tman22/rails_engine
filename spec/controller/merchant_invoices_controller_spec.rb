require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  fixtures :invoices, :merchants

  describe "#index" do
   it "responds with invoices for that merchant" do
      get :index, format: :json, merchant_id: 1
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.first['status']).to eq 'Ready'
      expect(invoices.last['status']).to eq 'Cancelled'
      expect(invoices.count).to eq 2
    end
  end
end
