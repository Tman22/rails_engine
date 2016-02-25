class Api::V1::Merchants::FavoriteController < Api::ApiController
  respond_to :json

  def show
    a = Merchant.find(params[:merchant_id]).favorite_customer
    respond_with Customer.find(a)
  end
end
