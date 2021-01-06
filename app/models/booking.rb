class Booking < ApplicationRecord
  belongs_to :occurence
  belongs_to :user
  has_one :course, through: :occurence

end
