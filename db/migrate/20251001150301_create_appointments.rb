class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true
      t.boolean :cancelled, default: false, null: false

      t.timestamps
    end
  end
end
