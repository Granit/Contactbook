class AddUserid < ActiveRecord::Migration
  def self.up
  add_column :tags, :user_id, :string
  end

  def self.down
  remove_column :tags, :user_id, :string
  end
end
