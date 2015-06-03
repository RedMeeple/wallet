class CreateMonies < ActiveRecord::Migration
  def change
    create_table :monies do |t|
      t.string :other_party
      t.decimal :amount
      t.date :date_of_transaction

      t.timestamps null: false
    end
  end
end
