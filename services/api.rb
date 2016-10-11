require 'net/http'
require 'json'

module Services
  class Api

    REGION = 'br'
    VERSION = 'v1.2'

    HOST = 'global.api.pvp.net'
    URL = "https://#{HOST}/api/lol/static-data/#{REGION}/#{VERSION}"

    CHAMPIONS_URL = "#{URL}/champion?api_key=#{ENV['API_KEY']}&champData=recommended"
    ITEMS_URL = "#{URL}/item?api_key=#{ENV['API_KEY']}"

    def self.get_champions_data
      response = Net::HTTP.get(URI(CHAMPIONS_URL))
      JSON.parse(response)
    end

    def self.get_items_data
      response = Net::HTTP.get(URI(ITEMS_URL))
      JSON.parse(response)
    end
  end
end