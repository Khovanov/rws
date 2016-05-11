class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  # STI: for easer navigation between models 
  delegate :coupes, :economies, :businesses, :sittings, to: :carriages

  # def seats(seat_type)
  #   self.carriages.inject(0) do |sum, carriage|
  #     sum += carriage.send(seat_type) ? carriage.send(seat_type) : 0
  #   end
  # end

  def seats(carriage_type, seat_type)
    Carriage.where(type: carriage_type, train_id: self.id).sum("#{seat_type}")
  end

  def carriages_order
    # return carriages if self.ascending_carriages_order?
    return carriages.ascending_number_order if self.ascending_carriages_order?
    # return carriages.reverse
    carriages.descending_number_order
  end
end
