require 'rails_helper'

feature 'the visitor visits the homepage' do 

	scenario 'the visitor sees text' do 
		visit root_path
		expect(page).to have_text "Welcome to my blog!"

	end

end
