class ChangeStartsAtFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :starts_at, :string
  end
end
