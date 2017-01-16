class AddPriceToPets < ActiveRecord::Migration
  def change
    add_column :pets, :price, :integer
  end
end
