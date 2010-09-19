class CreateKontaktsTagsJoin2 < ActiveRecord::Migration
  def self.up
 	 drop_table 'kontakts_tags'
    create_table 'kontakts_tags', :id => false do |t|
    t.column :kontakt_id, :integer
    t.column :tag_id, :integer
  end
  end

  def self.down
  drop_table 'kontakts_tags'
  end
end
