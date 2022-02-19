require_relative 'base_mastermind'

class ComputerMastermind < BaseMastermind

  def create_code
    print "Computer is creating a code"
    3.times do
      sleep 0.5
      print "."
    end

    4.times do
      colorIndex = rand(6)
      color = Game::COLORS[colorIndex]
      @game.code.push(color)
    end
  end

end