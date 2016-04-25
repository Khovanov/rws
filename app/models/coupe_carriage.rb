class CoupeCarriage < Carriage
  validates :top_seats, :bottom_seats, presence: true
  validates :top_seats, :bottom_seats, numericality: { only_integer: true }
end
