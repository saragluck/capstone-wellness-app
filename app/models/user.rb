class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :goals
  has_many :waters
  has_many :sleeps
  has_many :productivities
end
