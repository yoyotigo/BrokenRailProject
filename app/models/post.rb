class Post < ApplicationRecord
	has_many :comments
	validates :title, presence: true,	#presence true means it is required
	length: {minimum: 5}
end
