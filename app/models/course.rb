class Course < ApplicationRecord
  belongs_to :user
  has_many :occurences, dependent: :destroy
  has_many :bookings, through: :occurences

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  def teacher
    @name = User.find(self.user_id).first_name
    @surname = User.find(self.user_id).last_name
    return "#{@name} #{@surname}"
  end
end
