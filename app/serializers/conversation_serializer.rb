class ConversationSerializer < ActiveModel::Serializer
    attributes :id, :contact_id, :content, :contact_date
end
