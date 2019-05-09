# require "rails_helper"
require_relative '../spec_helper'
require 'rspec/core'

context 'when user submits parameters, they get queried data back' do
  scenario 'they get 10 items back' do
      RecipesResponse.create(:message, 10)
  end
end

