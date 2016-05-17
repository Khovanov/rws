class Carriage < ActiveRecord::Base
  belongs_to :train
  
  validates :number, :train, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { scope: :train_id }
  # STI: 
  validates :type, presence: true

  # STI: 
  # self.inheritance_column = :any_name_but_type 
  # If you want to disable Single Table Inheritance or use the type column for
  # something else, you can use self.inheritance_column = :fake_column

  # STI: for easer navigation between models 
  scope :coupes, -> { where(type: 'CoupeCarriage') }
  scope :economies, -> { where(type: 'EconomyCarriage') }
  scope :businesses, -> { where(type: 'BusinessCarriage') }
  scope :sittings, -> { where(type: 'SittingCarriage') }

  # scope :ordered, -> { order(train_id: :desc, number: :asc) }
  scope :train_order, -> { joins(:train).order("`trains`.`number` desc", number: :asc) }
  scope :ascending_number_order, -> { order(number: :asc) }
  scope :descending_number_order, -> { order(number: :desc) }
  before_validation :set_number

  # STI: for easer navigation between models
  # add to model train.rb:
  # delegate :coupes, :economies, to: :carriages

  # STI: 
  # def self.any_name_but_types
  # or class << self
  class << self
    def types
      %w(CoupeCarriage EconomyCarriage BusinessCarriage SittingCarriage)
    end

    # def model_name
    #   @@model_name ||= super
    # end
  end

  def set_number
    # last_number = Carriage.where(train: train).order(:number).last.try(:number)
    last_number = Carriage.where(train: train).maximum(:number)
    self.number ||= last_number ? last_number + 1 : 1
  end
end
