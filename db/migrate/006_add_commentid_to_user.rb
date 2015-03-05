class AddCommentidToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.integer :comment_id
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :comment_id
    end
  end
end
