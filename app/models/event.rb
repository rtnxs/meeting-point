class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence: true, length: {maximum: 255}
  validates :address, :datetime, presence: true
  validates :datetime, inclusion: {in: ((Time.current - 60)..), message: I18n.t('errors.messages.event.date_pass')},
            on: :create, if: -> { datetime.present? }
end
