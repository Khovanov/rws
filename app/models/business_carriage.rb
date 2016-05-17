class BusinessCarriage < Carriage
  validates :bottom_seats, presence: true
  validates :bottom_seats, numericality: { only_integer: true }

  def self.model_name
    Carriage.model_name
  end   
end
