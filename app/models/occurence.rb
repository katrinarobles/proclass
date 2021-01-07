class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :date, presence: true

  def dateparse
    DateTime.parse(self.date)
  end

end
