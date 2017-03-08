class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.references :krowspace
      t.integer :seat_number
      t.timestamps
    end
  end
end
