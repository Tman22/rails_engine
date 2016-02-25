class Api::V1::Transactions::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.find_by(transaction_params)
  end

  def index
    respond_with Transaction.where(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :result, :invoice_id, :credit_card_number, :created_at, :updated_at)
  end

end
