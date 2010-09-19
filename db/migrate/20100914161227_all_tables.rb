class AllTables < ActiveRecord::Migration
  def self.up
  
    create_table :users, :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :name,                      :limit => 100, :default => '', :null => true
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at


    end
    add_index :users, :login, :unique => true
  
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
    
    create_table :tags do |t|
      t.string :name
      t.references :kontakts

    end
  end

  def self.down
  	drop_table :users
	drop_table :kontakts
    drop_table :tags
  end
end
