class Application < ApplicationRecord
    belongs_to :user
    belongs_to :business
    has_many :contacts
    has_many :interviews
end
