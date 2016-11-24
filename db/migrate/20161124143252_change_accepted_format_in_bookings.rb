class ChangeAcceptedFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :accepted, :string
  end
end
