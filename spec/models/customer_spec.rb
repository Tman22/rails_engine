require 'rails_helper'

RSpec.describe Merchant, type: :model do
  fixtures :merchants, :invoices, :invoice_items, :customers, :transactions

  describe "covers methods" do
    it "favorite merchant" do
      customer = Customer.find(1).favorite_merchant

      expect(customer).to eq 1
    end
  end
end
