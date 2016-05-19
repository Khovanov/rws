class Ticket < ActiveRecord::Base
  belongs_to :user  
  belongs_to :train  
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  
  validates :user, 
            :full_name,
            :passport, 
            :train, 
            :start_station, 
            :end_station,
            presence: true
end
