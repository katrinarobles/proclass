class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  after_create :after_confirmation

  has_one_attached :photo
  has_many :courses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :occurences, through: :bookings

  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]*\z/ }
  # validates_uniqueness_of :username, :case_sensitive => false

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new(
      '||',
      Arel::Nodes::InfixOperation.new(
        '||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name]
    )
  end

  private

  def after_confirmation
    UserMailer.with(user: self).welcome.deliver_later
  end
end
