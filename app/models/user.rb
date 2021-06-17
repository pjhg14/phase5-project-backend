class User < ApplicationRecord
    has_secure_password
    
    has_many :applications
    has_many :businesses, through: :applications

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}" + "#{self.suffix == "" ? "" : " #{self.suffix}"}"
    end
    
end
