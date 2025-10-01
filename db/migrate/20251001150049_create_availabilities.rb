class CreateAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :availabilities do |t|
      t.references :provider, null: false, foreign_key: true
      t.json :starts_at
      t.json :ends_at
      t.string :source

      t.timestamps
    end
  end
end
