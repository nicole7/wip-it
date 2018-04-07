require 'rails_helper'

RSpec.describe "cats/new", type: :view do
  before(:each) do
    assign(:cat, Cat.new(
      :name => "MyString",
      :breed => "MyString",
      :bio => "MyString"
    ))
  end

  it "renders new cat form" do
    render

    assert_select "form[action=?][method=?]", cats_path, "post" do

      assert_select "input[name=?]", "cat[name]"

      assert_select "input[name=?]", "cat[breed]"

      assert_select "input[name=?]", "cat[bio]"
    end
  end
end
