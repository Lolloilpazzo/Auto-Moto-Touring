class Tour < ApplicationRecord
    belongs_to :user
    
    has_many :stops, dependent: :destroy
    has_many :comments
end
