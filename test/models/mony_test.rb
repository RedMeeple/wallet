require 'test_helper'

class MonyTest < ActiveSupport::TestCase
  test "running total is accurate" do
    first = Mony.create!(amount: -100.0, other_party: "Rent")
    assert_equal "50.0", first.total.to_s

    second = Mony.create!(amount: -150.0, other_party: "Groceries")
    assert_equal "-100.0", second.total.to_s

    third = Mony.create!(amount: 300.0, other_party: "Paycheck")
    assert_equal "200.0", third.total.to_s
  end

  test "spent" do

  end
end
