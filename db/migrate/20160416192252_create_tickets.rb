class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :train, index: true
      t.belongs_to :start_station, index: true
      t.belongs_to :end_station, index: true

      t.timestamps null: false
    end
  end
end
