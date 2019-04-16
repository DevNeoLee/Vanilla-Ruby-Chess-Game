require_relative "piece"
require "byebug"
require_relative "king"
require_relative "queen"
require_relative "knight"
require_relative "rook"
require_relative "pawn"
require_relative "bishop"

require_relative "null_piece.rb"


class Board

    attr_reader :board, :new_board

    def initialize
        @board = Array.new(8){Array.new(8)}
        @board[0][0] = Rook.new('black', 5)
        @board[0][1] = Knight.new('black',3)
        @board[0][2] = Bishop.new('black',3.5)
        @board[0][3] = Queen.new('black',9)
        @board[0][4] = King.new('black',10)
        @board[0][5] = Bishop.new('black',3.5)
        @board[0][6] = Knight.new('black',3)
        @board[0][7] = Rook.new('black',5)

        @board[7][0] = Rook.new('white', 5)
        @board[7][1] = Knight.new('white',3)
        @board[7][2] = Bishop.new('white',3.5)
        @board[7][3] = Queen.new('white',9)
        @board[7][4] = King.new('white',10)
        @board[7][5] = Bishop.new('white',3.5)
        @board[7][6] = Knight.new('white',3)
        @board[7][7] = Rook.new('white',5)

        @board = @board.each_with_index do |row, i|
            if i == 0
                next
            elsif i == 1
                
                row.map! {|square| square = Pawn.new('black', 1) }
                
            elsif i == 6
                row.map! {|square| square = Pawn.new('white', 1) }
        
            elsif i == 7
                next
                
            else
                row.map! {|square| square = NullPiece.new}
            end
        end
    end
    
    def [](pos)
        # debugger
        x, y = pos
        @board[x][y]
    end

   

    def []=(pos, val)
        x, y = pos
        @board[x][y] = val
    end

    def find_king(color)
        @board.each do |rows|
            rows.each do |square|
                if square.value == 10 && square.color == color
                    @board[rows][square]
                end
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

    def dup
        @board.dup
    end


end

