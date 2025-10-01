class Client < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :providers, through: :appointments

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
end
