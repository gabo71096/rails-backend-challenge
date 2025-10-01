class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :provider
  belongs_to :availability
end
