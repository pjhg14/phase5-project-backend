class Application < ApplicationRecord
    belongs_to :user
    belongs_to :business
    has_many :contacts
end
