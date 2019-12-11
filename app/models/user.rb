class User < ApplicationRecord
  #EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #TODO

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  #validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: EMAIL_REGEXP} #TODO

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Usver" if self.name.blank?
  end
end
