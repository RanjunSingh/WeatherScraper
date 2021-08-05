# @author Ranjun
require 'nokogiri'
require 'open-uri'
require 'geocoder'

# WeatherScraper class scrapes the darksky website for weather information.
class WeatherScraper

  # Creates an object of the WeatherScraper class.
  # @param locationString - the location name.
  def initialize(locationString)
    @location = locationString
    @parsePage = Nokogiri::HTML(URI.open("https://darksky.net/forecast/" + @location + "/us12/en"))
  end

  # Gets the temperature data from the darksky website.
  def getTemperatureLine
    @parsePage.css('span.summary.swap')
  end

  # Gets the weather summary data from the darksky website.
  def getSummary
    @parsePage.css('span.summary-high-low')
  end
end






