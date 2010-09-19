class Tag < ActiveRecord::Base

validates_presence_of :name
validates_length_of :name, :minimum => 1 
has_and_belongs_to_many :kontakts
	
	def self.search(search, user_id)
	  if search
		find(:all, :conditions => ["name LIKE ? AND user_id = ?", "%#{search}%", user_id.to_i])
	  else
		find(:all, :conditions => ["user_id = ?", user_id.to_i])
	  end
	end
	
	def self.find_tag(id, user_id)
		find(:all, :conditions => ["id = ? AND user_id = ?", id.to_i, user_id.to_i])
	end
end
