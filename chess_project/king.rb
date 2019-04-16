
class King
    attr_reader :color, :value, :current_pos

    MOVESET = [           
        [-1, 0],
        [-1, -1],
        [-1, 1],
        [1, 0],
        [1, -1],
        [1, 1],
        [0, -1],
        [0, 1]
    ]

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

    def initialize(color, value = 10)
        @color = color
        @value = value
        
    end

    def to_s
        "K"
    end
end

# king = King.new('black', 10)
# p king.possible_positions([3,2])