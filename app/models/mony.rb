class Mony < ActiveRecord::Base

  belongs_to :account

  def self.negative_balance
    if Mony.sum(:amount) < 0
      "You have a negative account balance.  Have you considered eating ramen for a while?"
    end
  end

  def self.total
    "$#{Mony.sum(:amount)}"
  end

  def self.spent
    array = Mony.select{ |mon| mon.amount < 0 }
    array = array.map! {|item| item.amount}
    array << 0
    "$#{array.reduce(:+).abs}"
  end

  def self.spent_this_month
    array = Mony.select{|money| money.amount < 0}
    array = array.select{|money| Date.today.mon == money.date_of_transaction.mon}
    array.map!{|item| item.amount}
    array << 0
    "$#{array.reduce(:+).abs}"
  end

  def self.transactions_this_month
    array = Mony.select{|money| (Date.today.mon == money.date_of_transaction.mon) && (Date.today.year == money.date_of_transaction.year)}
    array.length
  end

  def self.spent_last_month
    array = Mony.select{|money| money.amount < 0}
    array = array.select{|money| (Date.today.mon - 1 == money.date_of_transaction.mon) && (Date.today.year == money.date_of_transaction.year)}
    array.map!{|item| item.amount}
    array << 0
    "$#{array.reduce(:+).abs}"
  end

  def self.transactions_last_month
    array = Mony.select{|money| (Date.today.mon - 1 == money.date_of_transaction.mon) && (Date.today.year == money.date_of_transaction.year)}
    array.length
  end

  def self.biggest_expense
    "$#{Mony.order(:amount).first.amount.abs}"
  end

  def self.biggest_expense_last_month
    array = Mony.select{|money| (Date.today.mon - 1 == money.date_of_transaction.mon) && (Date.today.year == money.date_of_transaction.year)}
    array = array.select{|money| money.amount < 0}
    if array.empty?
      "You had no expenses last month"
    else
      array.sort_by{ |money| money.amount }
      "$#{array.last.amount.abs}"
    end
  end

  def self.biggest_recipient
    Mony.group('other_party').order("sum(amount)").first.other_party
  end
end
