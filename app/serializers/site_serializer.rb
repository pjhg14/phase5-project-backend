class SiteSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :domain, :url
end
