class Api::V1::InvoiceItems::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with InvoiceItem.find_by(invoice_items_params)
  end

  def index
    respond_with InvoiceItem.where(invoice_items_params)
  end

  private

  def invoice_items_params
    params.permit(:id, :quantity, :item_id, :invoice_id, :unit_price, :created_at, :updated_at)
  end

end
