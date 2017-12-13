class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times do
          # each cup has an array of four stones [:stone, :stone, :stone, :stone]
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    #assign the stones at the position to a variable
    stones = @cups[start_pos]
    #sets cup equal to empty array
    @cups[start_pos] = []

    until stones.empty?
      cup_idx = start_pos
      cup_idx += 1
      cup_idx == 0 if cup_idx + 1 == 14

      if cup_idx == 6
        @cup[cup_idx] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cup[cup_idx] << stones.pop if current_player_name == @name2
      else
        @cup[cup_idx] << stones.pop
      end
    end

    render

    next_turn(cup_idx)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_stones = @cups[6].length
    player2_stones = @cups[13].length

    if player1_stones == player2_stones
      :draw
    elsif player1_stones > player2_stones
      @name1
    else
      @name2
    end
  end
end
