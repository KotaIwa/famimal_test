class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :dog_cat
      t.string :breed
      t.datetime :birth_day
      t.text :image_url
      t.integer :owner_id
      t.timestamps
    end
  end
end
