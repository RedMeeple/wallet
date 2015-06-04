require 'test_helper'

class MonyTest < ActiveSupport::TestCase

  test "running total is accurate" do
    first = Mony.create!(amount: -100.0, other_party: "Rent", date_of_transaction: 2015-06-04)
    assert_equal "$0.0", Mony.total

    second = Mony.create!(amount: -150.0, other_party: "Groceries", date_of_transaction: 2015-05-20)
    assert_equal "$-150.0", Mony.total

    third = Mony.create!(amount: 300.0, other_party: "Paycheck", date_of_transaction: 2015-05-30)
    assert_equal "$150.0", Mony.total
  end

  test "negative balance" do
    Mony.create!(amount: -800.0, other_party: "Paycheck", date_of_transaction: 2015-05-30)
    assert_equal "You have a negative account balance.  Have you considered eating ramen for a while?",
      Mony.negative_balance
  end

  test "spent" do
    assert_equal "$50.0", Mony.spent
  end

  test "spent_this_month" do
    assert_equal "$50.0", Mony.spent_this_month
  end

  test "transactions_this_month" do
    assert_equal 2, Mony.transactions_this_month
  end

  test "spent_last_month" do
    assert_equal "$0", Mony.spent_last_month
  end

  test "transactions_last_month" do
    assert_equal 1, Mony.transactions_last_month
  end

  test "biggest_expense" do
    assert_equal "$50.0", Mony.biggest_expense
  end

  test "biggest_expense_last_month" do
    assert_equal "You had no expenses last month", Mony.biggest_expense_last_month
  end

  test "biggest_recipient" do
    Mony.create!(amount: -800.0, other_party: "Paycheck", date_of_transaction: 2015-05-30)
    assert_equal "Paycheck", Mony.biggest_recipient
  end
end
