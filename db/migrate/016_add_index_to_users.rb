class AddIndexToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      add_index :users, :email, unique: true
    end
  end

  def self.down
    change_table :users do |t|
      remove_index :users, :email
    end
  end
end
