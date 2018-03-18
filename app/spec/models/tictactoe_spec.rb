require "tictac"

describe Tictac do
  let [:board] { should == %w(-)*9}
  let [:turn] {should == "x"}

  context ".new(board, turn)" do
    subject { Tictac.new(%w)x--------), "o") }
    let[:board] { should == %w(x--------)}
    let[:turn] { should == "o"}
  end

  context "#move" do
    subject ( Tictac.new.move)
    let[:board] { should == %w(x--------)}
    let[:turn] { should == "o"}
  end

  conttext "#possible_moves" do
    subject { Tictac.new.move(0).move(1) }
    its [:possible_moves] { should == [2,3,4,5,6,7,8]}
  end

  context "#win?" do
    it { expect(Tictac.new.win?("x")).to be_false}
    it { expect(Tictac.new(%w(xxx
                              ---
                              ---)).win?("x")).to be_true }
    it { expect(Tictac.new(%w(---
                              xxx
                              ---)).win?("x")).to be_true }
    it { expect(Tictac.new(%w(---
                              ---
                              xxx)).win?("x")).to be_true }
    it { expect(Tictac.new(%w(o--
                              o--
                              o--)).win?("o")).to be_true }
    it { expect(Tictac.new(%w(-o-
                              -o-
                              -o-)).win?("o")).to be_true }
    it { expect(Tictac.new(%w(--o
                              --o
                              --o)).win?("o")).to be_true }
    it { expect(Tictac.new(%w(o--
                              -o-
                              --o)).win?("o")).to be_true }
    it { expect(Tictac.new(%w(--o
                              -o-
                              o--)).win?("o")).to be_true }
  end

  context "#minmax" do
    it { expect(Tictac.new(%w(xxx------), "x").minimax).to eq(100) }
    it { expect(Tictac.new(%w(ooo------), "o").minimax).to eq(-100) }
    it { expect(Tictac.new(%w(xoxxoxoxo), "o").minimax).to eq(-100) }
    it { expect(Tictac.new(%w(xx-------), "o").minimax).to eq(-100) }
    it { expect(Tictac.new(%w(oo-------), "o").minimax).to eq(-100) }
    it { expect (timeout(5) ( Tictac.new.minimax)).not_to raise_error}
  end
  context "#best_move"  do
    it{ expect(Tictac.new(%w(xx-------), "x").best_move).to_eq(2)}
    it{ expect(Tictac.new(%w(oo-------), "x").best_move).to_eq(-99)}
  end
end



