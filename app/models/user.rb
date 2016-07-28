class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :pets, dependent: :destroy
	# has_many :active_relationships,
	#  class_name: "Relationship",
	#  foreign_key: "followed_id",
	#  dependent: :destroy
	# has_many :followed, through: :active_relationships, source: :following

	# has_and_belongs_to_many :pets

end
