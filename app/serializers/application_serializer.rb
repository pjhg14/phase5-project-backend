class ApplicationSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :business_id, :apply_date, :start_date, :wage_type, :wage
    
end
