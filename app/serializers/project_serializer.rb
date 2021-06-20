class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :name, :project_date, :completed
end
