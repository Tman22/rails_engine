require 'csv'

desc "Import users from csv"
task import: :environment do

  file = File.join(Rails.root.join('lib', 'tasks'), 'customers.csv')
  CSV.foreach(file, headers: true) do |row|
    Customer.create!( row.to_h )
  end

  file = File.join(Rails.root.join('lib', 'tasks'), 'merchants.csv')
  CSV.foreach(file, headers: true) do |row|
    Merchant.create!(row.to_h)
  end

  file = File.join(Rails.root.join('lib', 'tasks'), 'items.csv')
  CSV.foreach(file, headers: true) do |row|
    formatted_price = row["unit_price"].to_f / 100
    Item.create!(name: row["name"],
                 description: row["description"],
                 unit_price: formatted_price,
                 merchant_id: row["merchant_id"],
                 created_at: row["created_at"],
                 updated_at: row["updated_at"] )
  end

  file = File.join(Rails.root.join('lib', 'tasks'), 'invoices.csv')
  CSV.foreach(file, headers: true) do |row|
    Invoice.create!(row.to_h)
  end

  file = File.join(Rails.root.join('lib', 'tasks'), 'transactions.csv')
  CSV.foreach(file, headers: true) do |row|
    Transaction.create!(row.to_h)
  end

  file = File.join(Rails.root.join('lib', 'tasks'), 'invoice_items.csv')
  CSV.foreach(file, headers: true) do |row|
    formatted_price = row["unit_price"].to_f / 100
    InvoiceItem.create!( item_id: row["item_id"],
                         quantity: row["quantity"],
                         unit_price: formatted_price,
                         invoice_id: row["invoice_id"],
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
  end

end
