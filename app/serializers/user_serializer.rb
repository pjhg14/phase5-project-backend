class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :full_name, :phone, :email

    has_many :applications
end
