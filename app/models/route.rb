class Route < ActiveRecord::Base
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes 
  has_many :trains 
  
  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def self.search(params)
    # return nil if params[:start_station].empty? || params[:end_station].empty? 

    # self.select('*')
    #   .joins(:railway_stations_routes)
    #   .where("`railway_station_id` = ? OR `railway_station_id` = ?", 
    #     params[:start_station], params[:end_station]).group("route_id")  

    self.find_by_sql([self.search_query, params[:start_station], params[:end_station]])
  end

  def start_station
    railway_stations.first
  end

  def end_station
    railway_stations.last
  end

  private

  def self.search_query
    <<-SQL
      SELECT * FROM `routes` WHERE
        (SELECT `railway_station_id`
         FROM `railway_stations_routes`
         WHERE `route_id` = `routes`.`id` AND
               `order` = (SELECT MIN(`order`)
                           FROM `railway_stations_routes`
                           WHERE `route_id` = `routes`.`id`)) = ? AND
        (SELECT `railway_station_id`
         FROM `railway_stations_routes`
         WHERE `route_id` = `routes`.`id` AND
               `order` = (SELECT MAX(`order`)
                           FROM `railway_stations_routes`
                           WHERE `route_id` = `routes`.`id`)) = ?
    SQL
  end

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
