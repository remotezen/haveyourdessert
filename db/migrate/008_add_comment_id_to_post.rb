class AddCommentIdToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :comment_id
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :comment_id
    end
  end
end
