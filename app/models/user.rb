class User < ActiveRecord::Base
	has_many :chirps
	has_many :relationships, foreign_key: :follower_id, 
									dependent: :destroy
	has_many :followeds, through: :relationships
	
	has_many :reverse_relationships, foreign_key: :followed_id,
                                   class_name:  "Relationship",
                                   dependent: :destroy
    has_many :followers, through: :reverse_relationships, 
    								source: :follower
	validates_presence_of :fname, :email, :password
end
