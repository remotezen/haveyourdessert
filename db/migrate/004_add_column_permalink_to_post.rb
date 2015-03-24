class AddColumnPermalinkToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :permalink
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :permalink
    end
  end
end
