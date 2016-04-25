class Carriage < ActiveRecord::Base
  belongs_to :train
  
  validates :number, :train, presence: true
  validates :number, numericality: { only_integer: true }
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
  end
end
