class AppointmentsController < ApplicationController
  # POST /appointments
  # Params: client_id, provider_id, starts_at, ends_at
  def create
    availability = Availability.find_by(provider_id: params[:provider_id], start_time: params[:starts_at], end_time: params[:ends_at])
    if availability.blank?
      return render json: { error: "Availability not found" }, status: :not_found
    end

    appointment = Appointment.new(client_id: params[:client_id], provider_id: params[:provider_id], availability_id: availability.id)
    if appointment.save
      render json: appointment, status: :created
    else
      render json: { error: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/:id
  # Bonus: cancel an appointment instead of deleting
  def destroy
    raise NotImplementedError, "Implement appointment cancelation endpoint"
  end
end
