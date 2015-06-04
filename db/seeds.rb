# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

200.times do
  a = (-500..500).to_a.sample
  Mony.create(other_party: Faker::Name.name, amount: a,
    date_of_transaction: Faker::Date.between(60.days.ago, Date.today),
    account_id: [1, 2].sample)
end

Account.create(name:"Checking")
Account.create(name:"Savings")
