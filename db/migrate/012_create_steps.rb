class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.integer :post_id
      t.text :step
      t.string :image
      t.string :title
      t.integer :recipe_id
      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
