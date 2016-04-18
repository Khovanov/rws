class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.integer :number
      t.string :type
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train, index: true

      t.timestamps null: false
    end
  end
end
