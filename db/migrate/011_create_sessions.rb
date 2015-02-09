class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :user_id
      t.datetime :time_out
      t.string :address
      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
