require 'test_helper'

class RentalTest < ActiveSupport::TestCase

  test "it creates a valid Rental model" do
    rental = Rental.new(name: 'Some Rental', daily_rate: 100)
    assert rental.valid?
  end

  test "it does not create a Rental model without daily rate" do
    rental = Rental.new(name: 'Some Rental')
    refute rental.valid?, 'daily_rate should be provided' 
    assert_not_nil rental.errors[:daily_rate], 'validation error is present'
  end

end
