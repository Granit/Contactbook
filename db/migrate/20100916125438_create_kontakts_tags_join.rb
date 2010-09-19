class CreateKontaktsTagsJoin1 < ActiveRecord::Migration
  def self.up
  create_table 'kontakts_tags', :id => false do |t|
    t.column :kontakt_id, :integer
    t.column :tag_id, :integer
  end

  end

  def self.down
  drop_table 'kontakts_tags'
  end
end
