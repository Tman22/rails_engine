require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  fixtures :items, :invoice_items

  describe "#index" do
   it "responds with a item for that invoice_item table" do
      get :index, format: :json, invoice_item_id: 1
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq 1
      expect(item['description']).to eq 'Darkness'
    end
  end
end
