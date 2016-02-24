require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  fixtures :invoices

  describe "#index" do
   it "responds with all invoices" do
     get :index, format: :json
     invoices = JSON.parse(response.body)
     
     expect(response).to be_success
     expect(invoices.first['status']).to eq 'Ready'
     expect(invoices.last['status']).to eq 'Cancelled'
    end
  end

  describe "#show" do
    it "responds with a invoice" do
      invoice = invoices(:one)
      get :show, id: invoice.id, format: :json
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq 'Ready'
    end
  end
end
