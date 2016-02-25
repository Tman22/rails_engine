class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    invoices.successful.group(:merchant_id).count.max_by { |k,v| v }.first
  end
end
