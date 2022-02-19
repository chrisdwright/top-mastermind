require_relative 'computer_mastermind'
require_relative 'computer_player'
require_relative 'human_mastermind'
require_relative 'human_player'

class Game

  attr_reader :code
  attr_reader :guesses
  
  COLORS = ["r", "g", "b", "y", "o", "p"]

  def initialize
    run_menu
  end

  def run_menu
    print "\n"
    puts "+============== Mastermind ==============+"
    puts "| 1. Human Player vs Computer Mastermind |"
    puts "| 2. Computer Player vs Human Mastermind |"
    puts "| 3. Quit                                |"
    puts "+========================================+"
    print "Select option: "
    option = gets.chomp.to_i
    print "\n"

    case option
    when 1
      start_game(HumanPlayer, ComputerMastermind)
    when 2
      start_game(ComputerPlayer, HumanMastermind)
    when 3
      print "Thank you for playing!\n\n"
    else
      puts "Invalid option."
      run_menu
    end
  end

  def start_game(player, mastermind)
    @player = player.new(self)
    @mastermind = mastermind.new(self)

    @code = []
    @guesses = []

    @mastermind.create_code

    loop do
      system("clear")
      draw_board

      if check_for_player_win
        print "The player wins!\n\n"
        break
      elsif check_for_mastermind_win
        print "The mastermind wins!\n\n"
        break
      end

      @player.make_guess
    end
  end

  def draw_board
    puts ""
    puts "  +==============+       === Colors ==="

    isVisible = @mastermind.class == HumanMastermind
    pos1 = isVisible ? @code[0] : "?"
    pos2 = isVisible ? @code[1] : "?"
    pos3 = isVisible ? @code[2] : "?"
    pos4 = isVisible ? @code[3] : "?"
    puts "  |  #{pos1}  #{pos2}  #{pos3}  #{pos4}  |  (b)lue (g)reen (y)ellow"

    puts "  +==============+  (o)range (p)urple (r)ed"
    9.downto(0) do |i|
      if @guesses[i]
        @guesses[i].draw
      else
        puts "  |  -  -  -  -  |"
      end
    end
    puts "  +==============+"
    print "\n"
  end

  def check_for_player_win
    @guesses.any? { |guess| guess.correct_both == 4 }
  end

  def check_for_mastermind_win
    @guesses.length == 10
  end

end

game = Game.new