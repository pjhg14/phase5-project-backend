class User < ApplicationRecord
    has_secure_password
    has_many :applications
    has_many :businesses, through: :applications

    def full_name
        "#{self.first_name} #{self.last_name} #{self.suffix}"
    end
    
end
