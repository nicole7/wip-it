# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rails/all'
require 'dotenv' ; Dotenv.load ".env.local", ".env.#{Rails.env}"

run Rails.application
