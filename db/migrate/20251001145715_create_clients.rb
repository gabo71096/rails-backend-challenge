class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :occupation
      t.string :language
      t.string :ethnicity
      t.string :religion
      t.string :email
      t.string :phone
      t.string :address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.timestamps
    end
  end
end
