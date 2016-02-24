class Api::V1::Transactions::FindController < Api::ApiController
  respond_to :json

  def show
    # respond_with Transaction.find_by(invoice_params) #problem with merchant_id
    case params.first.first
    when "id" then respond_with Transaction.find_by(id: params[:id])
    when "result" then respond_with Transaction.find_by(result: params[:result])
    when "invoice_id" then respond_with Transaction.find_by(invoice_id: params[:invoice_id])
    when "credit_card_number" then respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
    when "created_at" then respond_with Transaction.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Transaction.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    case params.first.first
    when "id" then respond_with Transaction.where(id: params[:id])
    when "result" then respond_with Transaction.where(result: params[:result])
    when "invoice_id" then respond_with Transaction.where(invoice_id: params[:invoice_id])
    when "credit_card_number" then respond_with Transaction.where(credit_card_number: params[:credit_card_number])
    when "created_at" then respond_with Transaction.where(created_at: params[:created_at])
    when "updated_at" then respond_with Transaction.where(updated_at: params[:updated_at])
    end
  end

end
