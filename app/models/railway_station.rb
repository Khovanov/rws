class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes 
  
  validates :title, presence: true

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.order')
    .joins(:railway_stations_routes)
    .order("railway_stations_routes.order")
    .uniq }

  def update_order(route, order)
    station_route = station_route(route)
    station_route.update(order: order) if station_route
  end

  def order_in(route)
    station_route(route).try(:order).to_i
  end

  private 

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
