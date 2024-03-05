# Calculate game state from comma separated input string "x,o,x,o,x,o,x,o,x"

class TicTacToe
  def determine_game_state(game_state_string)
    game_state_array = game_state_string.split(',')

    # Handle case when game state has no moves played
    game_state_array = game_state_string.split(',', 9) unless game_state_array.any?

    # Handle when input ends in ''
    if game_state_string.end_with?(',') && game_state_array.count == 8
      game_state_array << ''
    end

    valid = validate_game_state_string(game_state_array)

    return "Error" unless valid

    game_state_hash = {'x' => [], 'o' => [], '' => []}

    game_state_array.each_with_index do |tic_tac_toe, i|
      game_state_hash[tic_tac_toe.downcase] << i
    end

    valid = validate_game_state_hash(game_state_hash)

    return "Error" unless valid

    output = get_game_state(game_state_hash)

    output
  end

  def validate_game_state_string(game_state_array)
    game_state_array.count == 9 && game_state_array.all?{ |element| element.downcase == 'x' || element.downcase == 'o' || element == '' }
  end

  def validate_game_state_hash(game_state_hash)
    diff = game_state_hash['x'].count - game_state_hash['o'].count

    diff.abs <= 1
  end

  def get_game_state(game_state_hash)
    winners = []

    rulebook.each do |winning_sequences|
      if winning_sequences.all?{ |e| game_state_hash['x'].include?(e) }
        winners << 'X-Winner'
      end

      if winning_sequences.all?{ |e| game_state_hash['o'].include?(e) }
        winners << 'O-Winner'
      end
    end

    winners.uniq!

    case
    when winners.count > 1
      return 'Error'
    when winners.count == 1
      return winners.first
    else
      if game_state_hash[''].any?
        return 'Incomplete'
      else
        return 'Tie'
      end
    end

    # return 'Error' if winners.count > 1

    # return winners.first if winners.count == 1

    # if game_state_hash[''].any?
    #   return 'Incomplete'
    # else
    #   return 'Tie'
    # end
  end

  def rulebook
    [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  end
end
