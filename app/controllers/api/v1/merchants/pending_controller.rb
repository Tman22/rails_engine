class Api::V1::Merchants::PendingController < Api::ApiController
  respond_to :json

  def index
    array = Merchant.find(params[:merchant_id]).invoices.failed.pluck(:customer_id)
    respond_with find_customer(array)
  end

  private

  def find_customer(customer_array)
    customer_array.uniq.map { |id| Customer.find(id)}
  end
end
