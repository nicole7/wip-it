class CreateRacers < ActiveRecord::Migration[5.1]
  def change
    create_table :racers do |t|

      t.timestamps
    end
  end
end
