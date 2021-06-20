class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :full_name, :phone, :email

    # add personal info tables here:
    has_many :experiences
    has_many :projects
    has_many :sites
    # has_many :applications
end
