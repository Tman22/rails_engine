class AddCreditCardExpirationDateToTransactions < ActiveRecord::Migration
  def change
    enable_extension("citext")
    add_column :transactions, :credit_card_expiration_date, :citext
  end
end
