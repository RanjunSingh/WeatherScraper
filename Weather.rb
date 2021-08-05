# @author Ranjun
require 'forecast_io'
require './WeatherScraper.rb'

#Weather manages the information scraped from the darksky website.
class Weather

  # Initializes an instance of the Weather class.
  # @param location - The location name
  def initialize(location)
    @location = location
    @locationString = getLocationString

    unless @locationString.empty?
      @scraper = WeatherScraper.new(@locationString)
      @tempLine = @scraper.getTemperatureLine.text
      @summary = cleanSummary(@scraper.getSummary.text)
      extractData
    end

  end

  # Displays the weather information for the given location
  def display

    unless @locationString.empty?
      chooseOption
      puts @tempLine unless @tempLine.nil?
      puts @summary + "\n" unless @summary.nil?
    end
  end


  # Prompts user for units celsius or fahrenheit. Converts the scraper data into the correct format.
  def chooseOption
    puts "Fahrenheit or Celsius?, Enter F or C: "
    units = gets.chop

    if units.downcase == "c"
      convertToCelsius
    else
      convertToFahrenheit
    end
  end

  # converts the temperature data into celsius units.
  def convertToCelsius

    #convert from fahrenheit to celsius
    @temperature = toCelsius(@temperature)
    @feelsLike = toCelsius(@feelsLike)
    @low = toCelsius(@low)
    @high = toCelsius(@high)

    #reconstruct the output.
    @tempLine = @temperature.to_s + "˚C" + @condition
    @summary = "Feels Like: " + @feelsLike.to_s + "˚C" + "\n" +
        "Low: " + @low.to_s + "˚C" + " High: " + @high.to_s + "˚C"

  end

  # Converts the temperature data into fahrenheit
  def convertToFahrenheit
    @tempLine = @temperature.to_s + "˚F" + @condition
    @summary = "Feels Like: " + @feelsLike.to_s + "˚F" + "\n" +
        "Low: " + @low.to_s + "˚F" + " High: " + @high.to_s + "˚F"
  end

  # converts the location name into the location coordinates.
  def getLocationString

    #try-catch in ruby
    begin
      result = Geocoder.search(@location)
      locationCoords = result.first.coordinates #returns the coordinates of the location

      # convert the coordinates so that it can be inserted into the query correctly.
      locationString = locationCoords[0].to_s + "," + locationCoords[1].to_s

    rescue
      puts "The location could not be found"
      locationString = ""
    end
    return locationString
  end

  #helper function to initialize, extracts temperature data from the scraper strings.
  def extractData()
    @temperature = @tempLine.split(/˚/,2).first.to_i
    @condition = @tempLine.split(/˚/,2)[1]

    @feelsLike = @summary.split(/˚/,3).first
    @feelsLike = @feelsLike.split(/:/,2)[1][1..-1].to_i
    @low = @summary.split(/˚/,3)[1].split(/:/,2)[1][1..-1].to_i
    @high = @summary.split(/˚/,3)[2].split(/:/,2)[1][1..-1].to_i
  end

  # Cleans up the summary data.
  def cleanSummary(summary)
    summary = summary.gsub(/\s+/, " ").strip
    summary
  end

  # Converts a given temperature from Fahrenheit to Celsius.
  def toCelsius(tempF)
    tempC = (tempF-32) * 5 / 9
    tempC
  end

end