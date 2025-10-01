module Providers
  class AvailabilitiesController < ApplicationController
    # GET /providers/:provider_id/availabilities
    # Expected params: from, to (ISO8601 timestamps)
    def index
      start_time = Time.zone.parse(params[:from])
      end_time = Time.zone.parse(params[:to])

      availabilities = Availability.where(provider_id: params[:provider_id])
                                   .where("start_time >= ?", start_time)
                                   .where("end_time <= ?", end_time)
                                   .order(:start_time)

      render json: availabilities
    end
  end
end
