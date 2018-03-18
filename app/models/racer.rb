class Racer < ApplicationRecord

    #Second attempt at Ruby Racer now with more players

  # Returns a data structure that holds data about the race:
  # the players, their positions, the track length, etc.
  def initialize(players, die, length=30)
    @player_position = 0
    @length = length
    @players = players
    @die = die
    @player_positions = Hash[@players.map { |key| [key, 0]}]
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def self.finished?
    @player_positions.each do |player, position|
      return true if position >= @length
    end
      false
  end

  # Returns the winner if there is one, +nil+ otherwise
  def self.winner
    @player_positions.max_by{|player, position| position}[0]
  end

  # Rolls the die and advances +player+ accordingly
  def self.advance_player
    @player_positions.map do |player, position|
      position += die.roll
      @player_positions[player] = position
    end
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def self.board_visualization
    board = Array.new

    player_positions.each do |player, position|
      track = Array.new(@length) { [' ', '|'] }
      track[@player_positions[player]] = player
      board << track
    end

    board.each { |track| puts track.join}
  end
end
