class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.successful
    joins(:transactions).where(transactions: { result: "success" }  )
  end

  def self.total_revenue(params)
    where(created_at: params[:date])
    .joins(:transactions).where(transactions: {result: "success"})
    .joins(:invoice_items).sum("unit_price * quantity").to_f
  end

  def self.failed
    joins(:transactions).where(transactions: { result: "failed"})
  end
end
