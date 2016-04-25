class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  # STI: for easer navigation between models 
  delegate :coupes, :economies, to: :carriages

  def top_seats
    self.carriages.inject(0) { |sum, carriage| sum + carriage.top_seats }
  end

  def bottom_seats
    self.carriages.inject(0) { |sum, carriage| sum + carriage.bottom_seats }
  end
end
