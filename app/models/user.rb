class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :photo
  has_many :courses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :occurences, through: :bookings

  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9]*\z/ }
  validates_uniqueness_of :username, :case_sensitive => false
  def start_time
    self.courses.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def to_param
    username
  end
end
