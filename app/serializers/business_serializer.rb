class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :field, :description
end
