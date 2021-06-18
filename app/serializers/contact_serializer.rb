class ContactSerializer < ActiveModel::Serializer
    attributes :id, :application_id, :full_name, :email, :profile_url

    has_many :conversations
    # belongs_to :application, if: -> {include_applications?}

    # def include_applications?
    #     object.association(:application).loaded?
    # end
    
end
