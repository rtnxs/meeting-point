class Subscription < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :event
  belongs_to :user, optional: true

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validate :can_subscribe?, on: :create, if: -> { user.present? }
  validates :user_name, presence: true, unless: -> { user.present? }
  validate :email_used?, on: :create, unless: -> { user.present? }
  validates :user_email, presence: true, format: EMAIL_REGEXP, unless: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end

  private

  def email_used?
    errors.add(:user_email, I18n.t('controllers.subscriptions.email_used')) if User.where(email: user_email).present?
  end
end
