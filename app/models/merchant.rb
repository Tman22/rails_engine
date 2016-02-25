class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def revenue(params)
    if params[:date]
      invoices.where(created_at: params[:date]).successful
      .joins(:invoice_items).sum("unit_price * quantity").to_f
    else
      invoices.successful.joins(:invoice_items)
      .sum("unit_price * quantity").to_f
    end
  end

  def favorite_customer
    invoices.successful.group(:customer_id).count.max_by { |k,v| v }.first
  end
end
