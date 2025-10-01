class ChangeStartsAndEndsToAvailabilities < ActiveRecord::Migration[8.0]
  def change
    change_table :availabilities, bulk: true do |t|
      t.remove :starts_at, type: :json
      t.remove :ends_at, type: :json
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
