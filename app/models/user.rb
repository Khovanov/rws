class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, 
         :lockable, :timeoutable, :validatable
  has_many :tickets
  
  validates :name, presence: true
end
