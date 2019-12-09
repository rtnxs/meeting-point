class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 255}
  validates :address, :datetime, presence: true
end
