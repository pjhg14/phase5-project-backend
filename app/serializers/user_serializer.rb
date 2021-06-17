class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :full_name, :phone, :email

    has_many :applications
    # has_many :businesses, through: :applications
end
