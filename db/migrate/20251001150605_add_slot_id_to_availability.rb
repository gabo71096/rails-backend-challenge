class AddSlotIdToAvailability < ActiveRecord::Migration[8.0]
  def change
    change_table :availabilities, bulk: true do |t|
      t.string :slot_id
      t.index :slot_id, unique: true
    end
  end
end
