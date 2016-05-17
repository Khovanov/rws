class EconomyCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, numericality: { only_integer: true }

  def self.model_name
    Carriage.model_name
  end  
end
