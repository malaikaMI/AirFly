class Plane < ActiveRecord::Base
  belongs_to :airline
  has_many :flights
end
