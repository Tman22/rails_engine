require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantController, type: :controller do
  fixtures :invoices, :merchants

  describe "#index" do
   it "responds with a merchant for that invoice" do
      get :index, format: :json, invoice_id: 1
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'Tim'
      expect(merchant['id']).to eq 1
    end
  end
end
