class Guess
    
    attr_reader :colors
    attr_reader :correct_both

    def initialize(game)
        @game = game

        @colors = []
        @correct_both = 0
        @correct_color = 0
    end

    def draw
        puts "  |  #{@colors[0]}  #{@colors[1]}  #{@colors[2]}  #{@colors[3]}  | Perfect: #{@correct_both}  Correct Color: #{@correct_color}"
    end

    def calculate
        code_array = @game.code.map(&:clone)
        color_array = @colors.map(&:clone)

        # get perfect matches and remove them
        3.downto(0) do |i|
            if color_array[i] == code_array[i]
                @correct_both += 1
                color_array.delete_at(i)
                code_array.delete_at(i)
            end
        end

        # get color matches from remaining pairs
        color_array.each do |color|
            exists = code_array.any? { |code| code == color }
            @correct_color += 1 if exists
        end
    end

end