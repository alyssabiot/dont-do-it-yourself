class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :starts_at
      t.integer :duration
      t.boolean :accepted, default: false
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
