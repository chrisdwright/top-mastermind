require_relative 'base_player'

class ComputerPlayer < BasePlayer

    def initialize(game)
        super

        @known = Array.new(4) { "-" }
    end

    def make_guess
        guess = Guess.new(@game)

        @known.each_with_index do |c, i|
            if c == "-"
                colorIndex = rand(6)
                color = Game::COLORS[colorIndex]
                guess.colors.push(color)

                if @game.code[i] == color
                    @known[i] = color
                end
            else
                guess.colors.push(@known[i])
            end
        end
        
        guess.calculate
        @game.guesses.push(guess)

        sleep 1
    end

end