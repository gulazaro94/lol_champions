require 'dotenv'
Dotenv.load

require 'roda'
require_relative 'services/api'

class App < Roda
  plugin :render

  route do |r|
    r.root do
      Services::Api.new.get_data.to_s
    end
  end

end