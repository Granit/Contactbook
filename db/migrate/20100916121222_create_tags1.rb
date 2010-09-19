class CreateTags1 < ActiveRecord::Migration
  def self.up
  remove_column :kontakts, :tag_id, :integer
  add_column :kontakts, :tag_id, :array
  end

  def self.down
  add_column :kontakts, :tag_id, :array
  remove_column :kontakts, :tag_id, :integer
  end
end
