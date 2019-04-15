require_relative "board"
require "colorize"
require_relative "cursor"

class Display

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
    end

    def print_board(board)
        p board
    end
end