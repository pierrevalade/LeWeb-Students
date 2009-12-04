class AddUsersTwitterFields < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :twitter_uid, :string
    add_column :users, :avatar_url, :string
  end

  def self.down
    remove_column :users, :avatar_url
    remove_column :users, :twitter_uid
    remove_column :users, :name
  end
end
