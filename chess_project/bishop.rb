class Bishop
    attr_reader :value, :color, :current_pos

    MOVESET = [
        [1,1],
        [2,2],
        [3,3],
        [4,4],
        [5,5],
        [6,6],
        [7,7],

        [-1,-1],
        [-2,-2],
        [-3,-3],
        [-4,-4],
        [-5,-5],
        [-6,-6],
        [-7,-7],

        [1,-1],
        [2,-2],
        [3,-3],
        [4,-4],
        [5,-5],
        [6,-6],
        [7,-7],

        [-1,1],
        [-2,2],
        [-3,3],
        [-4,4],
        [-5,5],
        [-6,6],
        [-7,7]
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
    


    def initialize(color,value = 3.5)
        @color = color
        @value = value
        @current_pos = [0,0]

    end

    def to_s
        "B"
    end


end


