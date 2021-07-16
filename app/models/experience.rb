class Experience < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :exp_type, presence: true
    validates :completion_date, presence: true
end
