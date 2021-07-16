class Interview < ApplicationRecord
    belongs_to :application

    validates :interviewer, presence: true
    validates :iv_email, presence: true
    validates :iv_date, presence: true
    
end
