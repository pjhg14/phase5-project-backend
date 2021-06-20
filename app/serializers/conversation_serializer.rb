class ConversationSerializer < ActiveModel::Serializer
    attributes :id, :contact_id, :author, :content, :contact_date
end
