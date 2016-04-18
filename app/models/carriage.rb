class Carriage < ActiveRecord::Base
  belongs_to :train
  
  # validates :number, :train, :top_seats, :bottom_seats, :type, presence: true
  validates :number, :train, :top_seats, :bottom_seats, presence: true
end
