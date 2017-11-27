class Rental < ApplicationRecord

  validates :name, :presence => true
  validates :daily_rate, :numericality => true
  has_many :bookings, :dependent => :destroy

end
