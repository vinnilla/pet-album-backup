class Pet < ApplicationRecord
	belongs_to :user
	has_many :albums, dependent: :destroy
	has_many :photos, through: :albums

	has_many :followers, dependent: :destroy

	# @pet = Pet.first

	def self.search(search)
		# if search
		# 	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		# else
		# 	find(:all)
		# end
		where("search_terms ILIKE ?", "%#{search}%")
		
	end

end
