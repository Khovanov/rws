class Route < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes 
  has_many :trains 
  
  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    if railway_stations.present?
      self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end

  def stations_count
    if railway_stations.size < 2
      # для всего объекта:
      # errors.add(:base, "Route should contain at least 2 stations")
      # для поля объекта (label):
      errors.add(:railway_station, "Route should contain at least 2 stations")
    end
  end
end
