class Employee < ActiveRecord::Base
    has_many :details, dependent: :destroy
	validates :name,:id_number, presence:true,
	length:{minimum: 4}

	def self.search(search)
 		if search
    		self.where("name LIKE ? OR id_number LIKE ?", "#{search}%", "%#{search}%")
    	else
    		self.all
  		end
	end
end
