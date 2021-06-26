class ApplicationSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :business_id, :alias, :role, :apply_date, :start_date, :wage_type, :wage
    
    belongs_to :business, if: -> {include_businesses?}
    has_many :contacts
    has_many :interviews

    def include_businesses?
        object.association(:user).loaded?
    end
    
end
