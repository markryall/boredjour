require 'boredjour/notifier'
require 'boredjour/bonjour'
module BoredJour
  class BoredServer
    def initialize(name, port)
      @name = name
      @port = port
    end  
      
    def start
      Bonjour.new.start_listening('_boredjour._tcp', @name, @port, "#{@name}'s bored server")
      Notifier.say "bored server started"
    end
  end
end