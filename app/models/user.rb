class User < ActiveRecord::Base
	validates :username , presence: true ,uniqueness: {case_sensitive: false} , length: {minimum: 3 , maximum: 25}
  	
    emailRegex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	validates :email , presence: true ,uniqueness: {case_sensitive: false} , length: {minimum: 5 , maximum: 25},
			                                format: {with: emailRegex}

end