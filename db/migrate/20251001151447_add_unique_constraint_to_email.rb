class AddUniqueConstraintToEmail < ActiveRecord::Migration[8.0]
  def change
    add_index :clients, :email, unique: true
    add_index :providers, :email, unique: true
  end
end
