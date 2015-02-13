class CreateNutrients < ActiveRecord::Migration
  def self.up
    create_table :nutrients do |t|
      t.string :name
      t.string :group
      t.string :calcium
      t.string :sodium
      t.string :fiber
      t.string :vitamin_c
      t.string :potassium
      t.string :carbohydrate
      t.string :sugars
      t.string :fat
      t.string :water
      t.string :calories
      t.string :saturated
      t.string :monounsat
      t.string :polyunsat
      t.integer :item_id
      t.timestamps
    end
  end

  def self.down
    drop_table :nutrients
  end
end
