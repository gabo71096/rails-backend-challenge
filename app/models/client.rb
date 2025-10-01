class Client < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :providers, through: :appointments
end
