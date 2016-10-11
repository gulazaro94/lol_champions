require 'roda'

class App < Roda

  route do |r|
    r.root do
      'server'
    end
  end

end