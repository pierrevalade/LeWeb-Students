class AddTwitterStatusToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_status, :boolean, :default => false
  end

  def self.down
    remove_column :users, :twitter_status
  end
end
