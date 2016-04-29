class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes 
  
  validates :title, presence: true
end
