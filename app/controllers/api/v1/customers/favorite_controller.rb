class Api::V1::Customers::FavoriteController < Api::ApiController
  respond_to :json

  def show
    id = Customer.find(params[:customer_id]).favorite_customer

    respond_with Merchant.find(id)
  end
end
