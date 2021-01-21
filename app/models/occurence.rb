class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  validates :date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  ransacker :date do
    Arel.sql("date(occurences.date)")
  end

  def dateparse
    DateTime.parse(self.date)
  end

  def address
    "http://www.google.com/maps/place/#{self.latitude},#{self.longitude}/@#{self.latitude},#{self.longitude},17z"
  end

end
