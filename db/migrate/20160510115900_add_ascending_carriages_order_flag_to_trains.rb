class AddAscendingCarriagesOrderFlagToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :ascending_carriages_order, :boolean, default: true
  end
end
