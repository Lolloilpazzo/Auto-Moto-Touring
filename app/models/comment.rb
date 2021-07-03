class Comment < ApplicationRecord
    belongs_to :tour
    delegate :email, to: :user, prefix: true
    validates :body, presence: true
end
