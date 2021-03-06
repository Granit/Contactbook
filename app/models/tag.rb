class Tag < ActiveRecord::Base

validates_presence_of :name
validates_length_of :name, :minimum => 1 
has_and_belongs_to_many :kontakts
	
	def self.search(search, user_id)
	  if search
		find(:all, :conditions => ["name LIKE ? AND user_id = ?", "%#{search}%", user_id.to_s])
	  else
		find(:all, :conditions => ["user_id = ?", user_id.to_s])
	  end
	end
	
	def self.find_tag(id, user_id)
		find(:all, :conditions => ["id = ? AND user_id = ?", id.to_s, user_id.to_s])
	end
end
