require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices, :invoice_items, :customers, :transactions

  describe "covers methods" do
    it "tests successful" do
      invoice = Invoice.successful

      expect(invoice.first[:id]).to eq 2
    end

    it "test failed" do
      invoice = Invoice.failed

      expect(invoice.first[:id]).to eq 1
    end

    it "test total_revenue" do
      params = {date: "2012-03-27 14:53:59 UTC"}

      invoice = Invoice.total_revenue(params)

      expect(invoice).to eq 22222.0
    end
  end
end
