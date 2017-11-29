require 'test_helper'
include AppUtils

class BookingTest < ActiveSupport::TestCase

  test "it creates Booking model for a given Rental" do
    rental = Rental.new(name: 'Some Rental', daily_rate: 100)
    assert rental.valid?

    booking = Booking.new(email: 'user@host.com', start_at: '2099-01-01', end_at: '2099-01-02', price: 100 );
    rental.bookings << booking
    booking.valid? 
    assert_empty booking.errors
  end

end
