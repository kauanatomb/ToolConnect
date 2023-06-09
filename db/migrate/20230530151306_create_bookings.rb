class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tool, null: false, foreign_key: true
      t.string :status
      t.date :rental_start
      t.date :rental_end

      t.timestamps
    end
  end
end
