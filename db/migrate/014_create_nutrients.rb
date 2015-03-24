class CreateNutrients < ActiveRecord::Migration
  def self.up
    create_table :nutrients, id: false do |t|
      t.string :name
      t.string :group
      t.string :protein
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
      t.integer :product_id
    end

    add_index :nutrients, :product_id, unique: true
  end

  def self.down
    drop_table :nutrients
  end
end
