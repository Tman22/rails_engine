class Api::V1::Items::FindController < Api::ApiController
  respond_to :json

  def show
    case params.first.first
    when "id" then respond_with Item.find(params[:id])
    when "name" then respond_with Item.find_by(name: params[:name])
    when "description" then respond_with Item.find_by(description: params[:description])
    when "merchant_id" then respond_with Item.find_by(merchant_id: params[:merchant_id])
    when "unit_price" then respond_with Item.find_by(unit_price: params[:unit_price])
    when "created_at" then respond_with Item.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Item.find_by(updated_at: params[:updated_at])
    end
  end

  def index
    case params.first.first
    when "id" then respond_with Item.where(id: params[:id])
    when "name" then respond_with Item.where(name: params[:name])
    when "description" then respond_with Item.where(description: params[:description])
    when "merchant_id" then respond_with Item.where(merchant_id: params[:merchant_id])
    when "unit_price" then respond_with Item.where(unit_price: params[:unit_price])
    when "created_at" then respond_with Item.where(created_at: params[:created_at])
    when "updated_at" then respond_with Item.where(updated_at: params[:updated_at])
    end
  end
end
