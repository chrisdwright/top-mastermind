require_relative 'base_mastermind'

class HumanMastermind < BaseMastermind

    def create_code
      puts "Create a 4 color code."
      puts "Colors: (b)lue (g)reen (y)ellow (o)range (p)urple (r)ed"
      get_color("1st Color: ")
      get_color("2nd Color: ")
      get_color("3rd Color: ")
      get_color("4th Color: ")
    end

    def get_color(text)
      print text
      answer = gets.chomp

      if Game::COLORS.any? { |color| color == answer }
          @game.code.push(answer)
      else
          puts "Invalid color."
          get_color(text)
      end
    end
      
end