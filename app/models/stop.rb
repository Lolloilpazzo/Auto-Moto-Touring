class Stop < ApplicationRecord
  belongs_to :tour
  validates :address, presence: true
end
