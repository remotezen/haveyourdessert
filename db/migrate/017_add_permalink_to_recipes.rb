class AddPermalinkToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.string :permalink
    end
  end

  def self.down
    change_table :recipes do |t|
      t.remove :permalink
    end
  end
end
