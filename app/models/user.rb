class User < ActiveRecord::Base
	has_many :articles
	has_many :likes
	validates :username , presence: true ,uniqueness: {case_sensitive: false} ,
											 length: {minimum: 3 , maximum: 25}
  	
    emailRegex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	validates :email , presence: true ,uniqueness: {case_sensitive: false} , 
											length: {minimum: 5 , maximum: 25},
			                                format: {with: emailRegex}

	has_secure_password	
	has_many :friend_mappings, class_name: 'Friendship', foreign_key:'add_friend_id'
    has_many :add_friend_mappings, class_name: 'Friendship', foreign_key:'friend_id'
	has_many :friends , through: :friend_mappings
	has_many :add_friends, through: :add_friend_mappings
	


end