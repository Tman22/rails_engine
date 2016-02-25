require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices, :invoice_items, :customers, :transactions

  describe "covers methods" do
    it "revenue" do
      params = {date: "2012-03-27 14:53:59 UTC"}
      merchant = Merchant.find(1).revenue(params)

      expect(merchant).to eq 22222.0
    end

    it "revenue else test" do
      params = {}
      merchant = Merchant.find(1).revenue(params)

      expect(merchant).to eq 22222.0
    end

    it "test favorite_customer" do
      merchant = Merchant.find(1).favorite_customer

      expect(merchant).to eq 1 #id of customer
    end
  end
end
