require "io/console"
require "byebug"
require_relative "board"
require "colorize"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end


  def handle_key(key)
      # debugger
      if key == "\r" || key == " "
          p @cursor_pos
      elsif key == "\u0003"
          Process.exit(status = 0)
      else 
          KEYMAP.each do |k, v|
              if key == k
                  output = v
                  MOVES.each do |ele|
                      if ele == output
                          new_cursor_x = cursor_pos[0] + ele[0]
                          new_cursor_y = cursor_pos[1] + ele[1]
                          cursor_pos = [new_cursor_x, new_cursor_y]
                          update_pos([0, 0])
                      end
                  end
              end
          end
      end
  end

  def update_pos(diff)
        x, y = diff
        new_x = cursor_pos[0] + x
        new_y = cursor_pos[1] + y 
        if new_x >=0 && new_x <= 7 && new_y >=0 && new_y <= 7
            # cursor_pos = [new_x, new_y]
            @board.board.each_with_index do |row, i|
                str = ""
                row.each_with_index do |square, j|
                
                    if @board[[new_x, new_y]] != @board[[i, j]]
                        str += @board[[i, j]].to_s.colorize(:blue)
                    else
                        str += @board[[i, j]].to_s.colorize(:red)
                    end
                end
                puts str
                puts "\n"
            end
        end
    end
  end


  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

board_c = Board.new
cursor = Cursor.new([0,0], board_c)
cursor.handle_key("a")