class Pet < ApplicationRecord
	belongs_to :user
	has_many :albums, dependent: :destroy
	has_many :photos, through: :albums
	has_many :active_relationships,
		class_name: "Relationship",
		foreign_key: "follower_id",
		dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed

	# has_and_belongs_to_many :users

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
