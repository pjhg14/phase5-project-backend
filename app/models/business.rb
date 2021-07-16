class Business < ApplicationRecord
    belongs_to :user
    has_many :applications

    validates :name, presence: true
    validates :address, presence: true
    validates :field, presence: true
    validates :motto, presence: true
    validates :priority, presence: true
    
end
