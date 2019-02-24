require 'rails_helper'

feature 'signing in' do 

	let(:user) {FactoryBot.create(:user, email: 'testo@test.com', :password => 'password')} 
	#let(:page) {FactoryBot.create(:page, title: 'Rando')}

	def fill_in_signin_fields
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password

		click_button "Sign in"
	end

	scenario 'visiting the site to sign in' do 
		visit root_path
		fill_in_signin_fields
		expect(page).to have_content ("Signed in successfully")
	end

end