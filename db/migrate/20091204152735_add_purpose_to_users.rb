class AddPurposeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :purpose, :text
  end

  def self.down
    remove_column :users, :purpose
  end
end
