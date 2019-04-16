
class Pawn
    attr_reader :color, :value
   
    def initialize(color, value = 1)
        @color = color
        @value = value
    end

    def possible_positions(current_pos)
        @current_pos = current_pos
        @possible_positions = []
        if self.color == "black"
            new_x = current_pos[0] + 1
       
            @possible_positions << [new_x, current_pos[1]] if new_x >=0 && new_x <= 7 
        else
            new_x = current_pos[0] - 1
       
            @possible_positions << [new_x, current_pos[1]] if new_x >=0 && new_x <= 7 
        end
        @possible_positions
    end

    def to_s
        "P"
    end

end

# pawn = Pawn.new("white", 1)

# p pawn.possible_positions([3, 4])