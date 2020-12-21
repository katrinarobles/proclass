class Course < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 300 }
end
