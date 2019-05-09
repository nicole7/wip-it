# require "rails_helper"
require_relative '../spec_helper'
require 'rspec/core'

RSpec.describe "cats/show", type: :view do
  before(:each) do
    @cat = assign(:cat, Cat.create!(
      :name => "Name",
      :breed => "Breed",
      :bio => "Bio"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(/Bio/)
  end
end
