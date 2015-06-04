class AddAccountIdToMonies < ActiveRecord::Migration
  def change
    add_column :monies, :account_id, :integer
  end
end
