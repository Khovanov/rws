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

  after_create :send_create_notification
  after_destroy :send_destroy_notification

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end 

  private

  def send_create_notification
    TicketsMailer.create(self.user, self).deliver_now
  end 

  def send_destroy_notification
    TicketsMailer.destroy(self.user, self).deliver_now
  end          
end
