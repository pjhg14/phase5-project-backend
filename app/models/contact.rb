class Contact < ApplicationRecord
    belongs_to :application
    has_many :conversations
end
