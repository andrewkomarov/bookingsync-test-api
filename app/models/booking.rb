class Booking < ApplicationRecord

  validates :price, :numericality => true
  validate :price_should_be_calculated_correctly
  validate :dates_shouldnt_be_in_the_past
  validate :bookings_shouldnt_overlap
  belongs_to :rental

  include AppUtils


  def price_should_be_calculated_correctly
    unless price_correct?
      errors.add(:price, ' - Price is not correct')
    end
  end

  def dates_shouldnt_be_in_the_past
    if dates_in_the_past?
      errors.add :Dates, ' - Dates shouldn\'t be in the past'
    end
  end

  def bookings_shouldnt_overlap
    if booking_overlap?
      errors.add :Dates, ' - This period is not available (Bookings shouldn\'t overlap)'
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

  def dates_in_the_past?
    start_at < Date.today || end_at < Date.today
  end

end