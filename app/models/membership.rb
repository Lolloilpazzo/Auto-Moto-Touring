class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :tour
    validates_uniqueness_of :user_id, :scope => [:tour_id]
end
