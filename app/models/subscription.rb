class Subscription < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :event
  belongs_to :user

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: EMAIL_REGEXP, unless: -> { user.present? }
  validates :user, uniqueness: {scope: :event_id}, if: 'user.present?'
  validates :user_email, uniqueness: {scope: :event_id}, unless: 'user.present?'

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end
end
