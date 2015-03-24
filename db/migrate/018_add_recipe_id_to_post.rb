class AddRecipeIdToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :recipe_id
      add_index :posts, :recipe_id
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :recipe_id
      remove_index :posts, :recipe_id
    end
  end
end
