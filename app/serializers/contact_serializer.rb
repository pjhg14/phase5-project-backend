class ContactSerializer < ActiveModel::Serializer
    attributes :id, :application_id, :name, :email, :profile_url

    has_many :conversations
end
