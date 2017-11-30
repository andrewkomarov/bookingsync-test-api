require 'test_helper'
include AppUtils

class BookingTest < ActiveSupport::TestCase

  @@rental = Rental.new(name: 'Some Rental', daily_rate: 100)

  test "it creates Booking model for a given Rental" do
    assert @@rental.valid?
    booking = Booking.new(email: 'user@host.com', start_at: '2099-01-01', end_at: '2099-01-02', price: 100 );
    @@rental.bookings << booking
    booking.valid? 
    booking.save
    assert_empty booking.errors
  end

  test "It checks if bookings overlap during creation operation" do
    # change e.g. to start_at: '2099-01-02', end_at: '2099-01-03' to make this test fail (overlaps with Booking created above)
    booking = Booking.new(email: 'anotheruser@anotherhost.com', start_at: '2099-01-03', end_at: '2099-01-04', price: 100 );
    @@rental.bookings << booking
    assert booking.valid?,  'bookings shouldn\'t overlap'
  end  

end
