class Booking < ApplicationRecord

  validates :price, :numericality => true
  validate :price_should_be_calculated_correctly
  validate :bookings_shouldnt_overlap
  belongs_to :rental

  include AppUtils


  def price_should_be_calculated_correctly
    unless price_correct?
      errors.add(:price, 'Price is not correct')
    end
  end

  def bookings_shouldnt_overlap
    if booking_overlap?
      errors.add :price, 'Bookings shouldn\'t overlap'
    end
  end

  private

  def price_correct?
    price == dateDifference(start_at.to_s, end_at.to_s) * self.rental.daily_rate
  end

  def booking_overlap?
    # Overlaps if (A.start_at <= B.end_at) and (A.end_at >= B.start_at)
    overlap = Booking.where("start_at <= ? AND end_at >= ?", end_at, start_at);
    !overlap.empty?
  end


end