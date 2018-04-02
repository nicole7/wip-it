namespace :db do
  task recreate: [:drop, :create, :migrate, :seed]
end
