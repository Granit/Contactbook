class AllTables1 < ActiveRecord::Migration
  def self.up
  drop_table :kontakts
  create_table :kontakts do |t|
	  t.integer :user_id
      t.string :name
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :email
      t.string :phone_number
      t.string :address
      #t.string :tags
      t.timestamps
      t.references :users
    end
  end

  def self.down

  end
end
