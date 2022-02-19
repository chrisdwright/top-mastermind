require_relative 'base_player'
require_relative 'guess'

class HumanPlayer < BasePlayer

    def make_guess
        guess = Guess.new(@game)
        get_color("1st Color: ", guess)
        get_color("2nd Color: ", guess)
        get_color("3rd Color: ", guess)
        get_color("4th Color: ", guess)
        guess.calculate
        @game.guesses.push(guess)
    end

    def get_color(text, guess)
        print text
        answer = gets.chomp

        if Game::COLORS.any? { |color| color == answer }
            guess.colors.push(answer)
        else
            puts "Invalid color."
            get_color(text, guess)
        end
    end

end