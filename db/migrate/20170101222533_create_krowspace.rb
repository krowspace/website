class CreateKrowspace < ActiveRecord::Migration[5.0]
  def change
    create_table :krowspaces do |t|
      t.string :name
      t.string :location
      t.integer :seats
      t.boolean :active
      t.timestamps
    end
  end
end
