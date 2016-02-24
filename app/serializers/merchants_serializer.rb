class MerchantsSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :items
  has_many :items
end
