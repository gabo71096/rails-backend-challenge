class AvailabilitySync
  def initialize(client: CalendlyClient.new)
    @client = client
  end

  # Syncs availabilities for a provider based on the Calendly feed.
  # Candidates should fetch slots from the CalendlyClient and upsert Availability records.
  def call(provider_id:)
    slots = client.fetch_slots(provider_id).map do |slot|
      start_time = DateTime.parse("#{slot["starts_at"]["day_of_week"]} #{slot["starts_at"]["time"]}")
      end_time = DateTime.parse("#{slot["ends_at"]["day_of_week"]} #{slot["ends_at"]["time"]}")
      {
        slot_id: slot["id"],
        provider_id: slot["provider_id"],
        start_time: start_time,
        end_time: end_time,
        source: slot["source"]
      }
    end

    Availability.upsert_all(slots, unique_by: :slot_id)
  rescue StandardError => e
    Rails.logger.error("Error syncing availabilities for provider #{provider_id}: #{e.message}")
    raise e
  end

  private

  attr_reader :client
end
