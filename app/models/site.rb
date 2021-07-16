class Site < ApplicationRecord
    belongs_to :user

    validates :domain, presence: true
    validates :url, presence: true
    
end
