require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :title => "Title",
        :teaser => "Teaser",
        :body => "MyText"
      ),
      Page.create!(
        :title => "Title",
        :teaser => "Teaser",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Teaser".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
