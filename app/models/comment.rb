class Comment < ApplicationRecord
    belongs_to :tour
    belongs_to :user

    delegate :email, to: :user, prefix: true
    validates :body, presence: true
end
