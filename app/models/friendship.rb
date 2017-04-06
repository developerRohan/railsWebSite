class Friendship < ApplicationRecord
	belongs_to :add_friend , class_name: 'User' , foreign_key: :add_friend_id
	belongs_to :friend , class_name: 'User' , foreign_key: :friend_id
end
