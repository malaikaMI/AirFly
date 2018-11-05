class Passenger < ActiveRecord::Base
  belongs_to :booking
  # has_many :flights, through: :bookings
  validates :name, :email, :phone, :address, presence: true
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
