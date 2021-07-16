class Project < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :project_date, presence: true
    validates :completed, presence: true
    
end
