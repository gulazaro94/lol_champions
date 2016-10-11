require 'dotenv'
Dotenv.load

require 'roda'
require_relative 'services/api'
require_relative 'services/api_caching'
require_relative 'services/caching'
require_relative 'services/data_filtering'

class App < Roda
  plugin :static, ['/css']
  plugin :render

  route do |r|
    r.root do
      @data = Services::ApiCaching.get_data
      view(:index)
    end
  end

end