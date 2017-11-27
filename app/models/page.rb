class Page < ApplicationRecord
	validates_length_of :title, maximum: 100, message: "Title must be less than 100 characters."
	validates_length_of :teaser, maximum: 250, message: "Teaser must be less than 250 characters."

end
