class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.integer :post_id
      t.text :ingredients
      t.string :image
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
