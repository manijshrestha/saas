#Part 2
#a
#Rock-paper-scissors

#Exception Defs
class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

#game logic
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  
  player1 = game[0]
  player2 = game[1]
  
  winningPick = stronger_strategy(player1[1], player2[1])
  
  return winningPick == strategy?(player2[1]) ? player2 : player1
end

#returns the stronger pick, if same returns nil if wrong strategy is sent throws error
def stronger_strategy(s1, s2)
  winning_rule = {[:paper, :rock] => :paper, [:paper, :scissors] => :scissors, [:rock, :scissors] => :rock}
  list = [] << strategy?(s1) << strategy?(s2)
  winning_rule[list.sort!]
end

#helper method to map strategy
def strategy?(strategy)
  strategyList = {"r" => :rock, "p" => :paper, "s" => :scissors}
  raise NoSuchStrategyError unless strategyList[strategy.downcase]
  strategyList[strategy.downcase]
end

#b
#recursive algorithm for tournament
def rps_tournament_winner(tournament)
  if tournament[0][0].class == String #if we are at the last set ie, array element is of type Sting class
    return rps_game_winner(tournament)
  else
    return rps_tournament_winner( [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])] )
  end
end

#Tests
#rps_game_winner([]) #should throw exception
#rps_game_winner [ [ "Armando", "M" ], [ "Dave", "S" ] ]# => Should throw an exception as M is invalid pick
#print rps_game_winner [ [ "Armando", "P" ], [ "Dave", "S" ] ]# => returns the list ["Dave", "S"] wins since S>P
#print rps_game_winner [ [ "Armando", "S" ], [ "Dave", "S" ] ]# => returns the list ["Armando", "S"] both are same and Armando is first

#Tournament Test
# print rps_tournament_winner [
# [
# [ ["Armando", "P"], ["Dave", "S"] ],
# [ ["Richard", "R"], ["Michael", "S"] ],
# ],
# [
# [ ["Allen", "S"], ["Omer", "P"] ],
# [ ["David E.", "R"], ["Richard X.", "P"] ]
# ]
# ]
