class ExperienceSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :title, :exp_type, :description, :completion_date
end
