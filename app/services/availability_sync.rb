class AvailabilitySync
  def initialize(client: CalendlyClient.new)
    @client = client
  end

  # Syncs availabilities for a provider based on the Calendly feed.
  # Candidates should fetch slots from the CalendlyClient and upsert Availability records.
  def call(provider_id:)
    slots = client.fetch_slots(provider_id).each do |slot|
      # Map id to slot_id in order for upsert to update correctly if conflict
      slot.transform_keys! { |key| key == "id" ? "slot_id" : key }
    end

    Availability.upsert_all(slots, unique_by: :slot_id)
  rescue StandardError => e
    Rails.logger.error("Error syncing availabilities for provider #{provider_id}: #{e.message}")
    raise e
  end

  private

  attr_reader :client
end
