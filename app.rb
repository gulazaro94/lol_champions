require 'roda'

class App < Roda
  plugin :render

  route do |r|
    r.root do
      view('index')
    end
  end

end