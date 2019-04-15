require_relative "piece"
# require_relative "null piece"


class Board
    def initialize

        @board = Array.new(8){Array.new(8)}
        @board[0][0] = Piece.new(5)
        @board[0][1] = Piece.new(3)
        @board[0][2] = Piece.new(3.5)
        @board[0][3] = Piece.new(9)
        @board[0][4] = Piece.new(10)
        @board[0][5] = Piece.new(3.5)
        @board[0][6] = Piece.new(3)
        @board[0][7] = Piece.new(5)

        @board[7][0] = Piece.new(5)
        @board[7][1] = Piece.new(3)
        @board[7][2] = Piece.new(3.5)
        @board[7][3] = Piece.new(9)
        @board[7][4] = Piece.new(10)
        @board[7][5] = Piece.new(3.5)
        @board[7][6] = Piece.new(3)
        @board[7][7] = Piece.new(5)

        @board.each_with_index do |row, i|
            if i == 1
                row.each {|square| square = Piece.new(1) }
            elsif i == 6
                row.each {|square| square = Piece.new(1) }
            end
        end
    end

    def move_piece
        begin
            p "please enter x co ordinate:"
            x = gets.chomp.to_i
            p "please enter y co ordinate:"
            y = gets.chomp.to_i

            if (x >= 0 && x <= 7) &&  (y >= 0 && y <= 7) && @board[x][y]
                 p "please enter x co ordinate:"
                get_x = gets.chomp.to_i
                p "please enter y co ordinate:"
                get_y = gets.chomp.to_i
                
                if (get_x >= 0 && get_x <= 7) &&  (get_y >= 0 && get_y <= 7) && @board[get_x][get_y]
                    @board[get_x][get_y] = @board[x][y]
                    @board[x][y] = nil
                else
                    raise StandardException
                end

            else 
                raise StandardException 
            end

        
        rescue StandardException 
            
            retry
            
        end
        
    end


end