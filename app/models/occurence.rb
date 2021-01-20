class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  ransacker :date do
    Arel.sql("date(occurences.date)")
  end

  def dateparse
    DateTime.parse(self.date)
  end

end
