class AddUnitPriceAndQuantityToInvoiceItems < ActiveRecord::Migration
  def change
    enable_extension("citext")
    add_column :invoice_items, :unit_price, :citext
    add_column :invoice_items, :quantity, :citext
  end
end
