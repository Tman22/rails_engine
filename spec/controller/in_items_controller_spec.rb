require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  fixtures :invoices, :transactions

  describe "#index" do
   it "responds with all items of that invoice" do
      get :index, format: :json, invoice_id: 1
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.first['description']).to eq 'Darkness'
    end
  end
end
