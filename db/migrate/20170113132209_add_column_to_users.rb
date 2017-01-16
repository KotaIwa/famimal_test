class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :seller_or_buyer, :integer
  end
end
