class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence: true, length: {maximum: 255}
  validates :address, :datetime, presence: true
  validate :check_datetime, on: :create, if: -> { datetime.present?}

  private

  def check_datetime
    errors.add(:datetime, t('errors.messages.event.date_pass')) if datetime&. < Time.current - 240
  end
end
