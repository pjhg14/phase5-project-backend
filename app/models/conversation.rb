class Conversation < ApplicationRecord
    belongs_to :contact

    validates :author, presence: true
    validates :content, presence: true
    
end
