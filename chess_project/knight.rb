
class Knight 
    attr_reader :color, :value

      MOVESET = [      
     [-2, -1],
     [-2, 1],
   
     [2, -1],
     [2, 1],

     [-1, -2],
     [1, -2],
     [-1, 2],
     [1, 2],
    ] 
    
    def initialize(color, value = 3)
        @color = color
        @value = value
    end

    def possible_positions(current_pos)
        @current_pos = current_pos
        @possible_positions = []
        MOVESET.each do |ele|
            new_x = current_pos[0] + ele[0]
            new_y = current_pos[1] + ele[1]
            @possible_positions << [new_x, new_y] if new_x >=0 && new_x <= 7 && new_y >=0 && new_y <= 7
        end
        @possible_positions
    end

    def to_s
        "N"
    end

end

knight = Knight.new("blue", 3)

# p knight.possible_positions([3, 4])