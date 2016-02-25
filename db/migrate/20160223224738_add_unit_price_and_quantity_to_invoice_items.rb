class AddUnitPriceAndQuantityToInvoiceItems < ActiveRecord::Migration
  def change
    enable_extension("citext")
    add_column :invoice_items, :unit_price, :decimal
    add_column :invoice_items, :quantity, :integer
  end
end
