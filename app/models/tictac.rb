class Tictac < ApplicationRecord
  DIMENTION = 3
  SIZE = DIMENTION * DIMENTION

  def initialize(board = nil, turn = "x")
    @board = board || %w(-)*SIZE
    @turn = turn
  end

  def move(index)
    position = Position.new(@board.dupe, xturn("o", "x"))
    position.board[index] = turn
    position
  end

  def xturn(x,o)
    turn == "x" ? x : o
  end

  def possible_moves
    @board.map.with_index { |p,i| i if p=="-"}.compact
  end

  def win?(turn)
    rows = @board.each_slice(DIMENSION).to_a
    rows.any? { |rows| row.all? { |p| p == turn }} ||
    rows.transpose.any? { |column| column.all? |p| p == turn}} ||
    rows.map.with_index.all? { |row, index| row[index] == turn}
    rows.map.with_index.all? { |row, index| row[(DIMENTION - 1) -index] == turn}
  end

  def minimax(depth = 1)
    return 100 if win?("x")
    return -100 if win?("o")
    return 0 if possible_moves.empty?
    @@minimax ||={}
    value = @@minmax[@board]
    return value if value
    @@minimax[@board] = possible_moves.map { |index|}
    possible_moves.map { |index| move[index].minmax(depth + 1)}.send(xturn[:max. :min}) + xturn(-depth,depth)
  end

  def best_move
    possible_moves.max_by { |index| move[index].minimax}
  end
end

