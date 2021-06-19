class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :full_name, :phone, :email

    # add personal info tables here:
    # has_many :applications
end
