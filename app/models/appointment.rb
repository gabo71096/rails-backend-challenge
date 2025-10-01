class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :provider
  belongs_to :availability

  before_create :check_availability_overlap

  scope :active, -> { where(cancelled: false) }

  private

  def check_availability_overlap
    if Appointment.active.exists?(availability_id: availability_id, provider_id: provider_id)
      errors.add(:availability_id, "is already booked")
      throw :abort
    end
  end
end
