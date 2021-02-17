# Weather Script

require 'HTTParty'

def get_weather(city, country)
    # weather_data = CLIENT.current_weather(
    #   city: city,
    #   country: country,
    #   units: ARGV[0] || 'metric'
    # )
    # weather_data.main.feels_like

    base_url = "https://api.openweathermap.org/data/2.5/weather"
    auth = "&appid="
    filter_params = 'q=London,UK&units=imperial'
    resp = HTTParty.get(base_url + '?' + filter_params + '&' + auth)
    data = JSON.parse(resp.body)
    data['main']['feels_like']

  rescue OpenWeather::Errors::Fault, Faraday::ResourceNotFound => e # city/country not found(?)
    puts "City or country not found. Try again!"
    return
end

puts 'Please provide a city'
city = STDIN.gets.chomp
puts 'Please provide a country'
country = STDIN.gets.chomp

temperature = get_weather(city,country)

puts "The weather in #{city}, #{country} feels like #{temperature} degrees"
