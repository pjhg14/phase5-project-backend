class Contact < ApplicationRecord
    belongs_to :application
    has_many :conversations

    def full_name
        "#{self.first_name} #{self.last_name}" + "#{self.suffix == "" ? "" : " #{self.suffix}"}"
    end
    
end
