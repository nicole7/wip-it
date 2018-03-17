class RacerController < ApplicationController
  def index
  end

  def create
    @players = [:a, :b]
    @die = Die.new
    @game = Racer.new(players, die)
  end

  def show
    # reset_screen
    @game.board_visualization
    # sleep(1)

    until @game.finished?
      @game.advance_player
      @game.player_positions
      # reset_screen
      @game.board_visualization
      # sleep(0.2)
    end

    puts "Player '#{game.winner}' wins!"
    render 'show'
  end
end