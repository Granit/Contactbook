class CreateTags < ActiveRecord::Migration
  def self.up
  	add_column :kontakts, :tag_id, :integer
  	
  end

  def self.down
  	remove_column :kontakts, :tag_id, :integer
  end
end
