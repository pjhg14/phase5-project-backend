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
        # Return # of most recent application, # of highest priority businesses, # of contacts with recent conversations
        contacts = self.applications.map {|application| application.contacts }.flatten

        {
            applications: self.applications.first(5),
            businesses: self.businesses.max_by(5) {|business| business.priority},
            contacts: contacts.first(5)
        }
    end
    
    
end
