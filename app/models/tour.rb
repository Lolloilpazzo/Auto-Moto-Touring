class Tour < ApplicationRecord
    belongs_to :user
    
    has_many :stops, dependent: :destroy
    has_many :comments

    has_many :memberships 
    has_many :users, :through => :memberships,dependent: :destroy
    
end
