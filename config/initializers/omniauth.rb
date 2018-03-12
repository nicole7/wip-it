Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1169252039845149', '507722d49d65c95948a927b4794349f6'
  provider :github, '5ac3c31b7f093bf9a53e', '63ce8a8f6e33bd67dd412d847fda160cb6f88d4b'
end