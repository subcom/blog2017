require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
end


feature 'the visitor visits the homepage' do 

	scenario 'the visitor sees text' do 
		visit root_path
		expect(page).to have_text "Welcome to my blog!"

	end

end