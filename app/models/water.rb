class Water < ApplicationRecord
  belongs_to :user
  validates :time, :amount, :date, presence: true
end
