class Event < ApplicationRecord

  validates :title, presence: true, length: {maximum: 255}
  validates :address, :datetime, presence: true
end
