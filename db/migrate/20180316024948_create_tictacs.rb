class CreateTictacs < ActiveRecord::Migration[5.1]
  def change
    create_table :tictacs do |t|

      t.timestamps
    end
  end
end
