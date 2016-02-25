class Api::V1::Items::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find_by(item_params)
  end

  def index
    respond_with Item.where(item_params)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
  end
end
