class SittingCarriage < Carriage
  validates :bottom_seats, presence: true
  validates :bottom_seats, numericality: { only_integer: true }
end
