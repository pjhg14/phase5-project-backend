class BusinessSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :field, :description

    # has_many :applications
end
