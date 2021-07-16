class Application < ApplicationRecord
    belongs_to :user
    belongs_to :business
    has_many :contacts
    has_many :interviews

    validates :alias, presence: true
    validates :role, presence: true
    validates :apply_date, presence: true
    validates :start_date, presence: true
    validates :wage_type, presence: true
    validates :wage, presence: true

end
