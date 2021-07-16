class Contact < ApplicationRecord
    belongs_to :application
    has_many :conversations

    def full_name
        "#{self.first_name} #{self.last_name}" + "#{self.suffix == "" ? "" : " #{self.suffix}"}"
    end
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true

end
