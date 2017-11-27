require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :title => "MyString",
      :teaser => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input[name=?]", "page[title]"

      assert_select "input[name=?]", "page[teaser]"

      assert_select "textarea[name=?]", "page[body]"
    end
  end
end
