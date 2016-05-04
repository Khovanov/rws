class AddOrderToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :order, :integer
  end
end
