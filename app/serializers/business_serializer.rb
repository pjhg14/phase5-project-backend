class BusinessSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :field, :motto, :priority, :about, :description

    has_many :applications, if: -> {include_applications?}

    def include_applications?
        object.association(:applications).loaded?
    end
end
