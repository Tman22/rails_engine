class Api::V1::Invoices::FindController < Api::ApiController
  respond_to :json

  def show
    # respond_with Invoice.find_by(invoice_params) #problem with merchant_id
    case params.first.first
    when "id" then respond_with Invoice.find_by(id: params[:id])
    when "status" then respond_with Invoice.find_by(status: params[:status])
    when "merchant_id" then respond_with Invoice.find_by(merchant_id: params[:merchant_id])
    when "customer_id" then respond_with Invoice.find_by(customer_id: params[:customer_id])
    when "created_at" then respond_with Invoice.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Invoice.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    case params.first.first
    when "id" then respond_with Invoice.where(id: params[:id])
    when "status" then respond_with Invoice.where(status: params[:status])
    when "merchant_id" then respond_with Invoice.where(merchant_id: params[:merchant_id])
    when "customer_id" then respond_with Invoice.where(customer_id: params[:customer_id])
    when "created_at" then respond_with Invoice.where(created_at: params[:created_at])
    when "updated_at" then respond_with Invoice.where(updated_at: params[:updated_at])
    end
  end

  private

  def invoice_params
    params.permit(:invoice).permit(:customer_id, :merchant_id, :status)
  end
end
