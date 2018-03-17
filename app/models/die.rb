class Die < ApplicationRecord
   belongs_to :racer

  def initialize(side_count = 6, die = 0)
    @side_count = side_count
    @die = die
  end

  def roll
    @die = rand(side_count) + 1
  end
end
