class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    a = Invoice.total_revenue(params)
    respond_with({total_revenue: a.to_s})
  end

  def show
    a = Merchant.find(params[:merchant_id]).revenue(params)
    respond_with({revenue: a.to_s})
  end
end
