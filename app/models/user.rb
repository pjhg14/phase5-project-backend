class User < ApplicationRecord
    has_secure_password
    
    has_many :applications
    has_many :businesses
    has_many :experiences
    has_many :projects
    has_many :sites

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}" + "#{self.suffix == "" ? "" : " #{self.suffix}"}"
    end

    def dashboard
        {
            applications: self.applications.first(5),
            businesses: self.businesses.first(5),
            contacts: self.applications.first.contacts.first(5)
        }
    end
    
    
end
