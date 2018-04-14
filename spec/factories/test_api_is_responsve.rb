require "rails_helper"

context 'when user submits parameters, they get queried data back' do
  scenerio 'they get 10 items back' do
      RecipesResponse.create(:message, 10)
  end
end

