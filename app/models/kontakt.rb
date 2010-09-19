class Kontakt < ActiveRecord::Base

validates_presence_of :name
validates_length_of :name, :minimum => 1 
belongs_to :user
has_and_belongs_to_many :tags 
#accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if =>
#proc { |attrs| attrs.all? { |k, v| v.blank? } }
	
		
	def self.user_kontakts(user_id)
		find_all_by_user_id(user_id)
	end

	def self.search(search, user_id)
	  if search
		find(:all, :conditions => ["name LIKE ? AND user_id = ?", "%#{search}%", user_id.to_i])
	  else
		find(:all, :conditions => ["user_id = ?", user_id.to_i])
	  end
	end

	def self.find_tag(tag_id, user_id)
		find(:all, :conditions => ["tag_id = ? AND user_id in (?)", tag_id.to_i, user_id.to_i])
	end
	
end
