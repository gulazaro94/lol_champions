require 'net/http'
require 'json'

module Services
  class Api

    REGION = 'br'
    URL = "https://global.api.pvp.net/api/lol/static-data/#{REGION}/v1.2/champion?api_key=#{ENV['API_KEY']}"

    def self.get_champions_data
      response = Net::HTTP.get(URI(URL))
    end
  end
end