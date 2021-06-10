class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :full_name, :phone, :email
end
