class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :courses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :occurences, through: :bookings

  def start_time
    self.courses.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
