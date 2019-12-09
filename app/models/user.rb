class User < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: EMAIL_REGEXP}
end
