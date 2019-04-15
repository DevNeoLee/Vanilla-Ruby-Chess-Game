# PHASE 2

class CoffeeError < StandardError
  p 'not a fruit'; end
def convert_to_int(str)
  begin
  str.to_i
  p "it worked!"
  rescue 
    p "error!"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]


def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
  
    maybe_fruit = gets.chomp
    
    if FRUITS.include?(maybe_fruit)
      p "Awesome. Thank you"
    else 
      raise CoffeeError
    end
  rescue CoffeeError
    retry
    
  end


end  


class NotEnoughTimeError < StandardError; end 
class EmptyError < StandardError; end
# PHASE 4
class BestFriend
  attr_reader :name, :yrs_known, :fav_pastime

  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    begin
     years = yrs_known >= 5

     if years 
      puts "Wowza, we've been friends for #{yrs_known}. Let's be friends for another #{1000 * yrs_known}."
     else 
      raise NotEnoughTimeError
      
    end
    rescue NotEnoughTimeError
      puts "not enough time"
     
    end
  end

  def do_friendstuff
    begin
      if fav_pastime.empty? == false
        puts "Hey bestie, let's go #{fav_pastime}. Wait, why don't you choose. 😄"
      else 
        raise EmptyError
        
      end
    rescue EmptyError
      p "we need something to do"
    end
  end
  def give_friendship_bracelet
    begin
      if @name.empty? == false
        puts "Hey bestie, I made you a friendship bracelet. It says my name, #{name}, so you never forget me." 
      else 
        raise EmptyError
        
      end
    rescue EmptyError
      p "what is your name"
    end
  end
end


