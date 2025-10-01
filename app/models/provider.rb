class Provider < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :availability_windows, dependent: :destroy
  has_many :clients, through: :appointments
end
