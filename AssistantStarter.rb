require './Weather.rb'


  def main()
    puts "Welcome to the Assistant!"
    choice = -1
    until choice == 0
      begin
        printMenu()
        puts "Please select an option:"
        choice = gets.to_i
        # puts "choice is " + choice.to_s

        #switch statement in ruby.
        case choice
        when 0
        when 1
          puts "Teammate 1's feature"
        when 2
          weather()
        when 3
          puts "Teammate 3's feature"
        when 4
          puts "Teammate 4's feature"
        else
          puts "Invalid Option"
        end
      rescue
        puts "Exception Occurred"
      end
    end
  end


  def printMenu()
    puts
    puts "1) Teammate 1's option"
    puts "2) Check Weather option"
    puts "3) Teammate 2's option"
    puts "4) Teammate 3's option"
    puts "0) Exit assistant"
  end

  def weather()
    puts "Enter your location (city name)"
    location = gets
    weather = Weather.new(location)
    weather.display
  end


main()



	
    
