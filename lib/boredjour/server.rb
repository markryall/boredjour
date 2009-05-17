require 'boredjour/notifier'
require 'boredjour/bonjour'
require 'boredjour/publisher'
module BoredJour
  class BoredServer
    attr_reader :name, :port
    
    def initialize(name, port)
      @name = name
      @port = port
    end  
      
    def start
      Bonjour.new.start_listening('_boredjour2._tcp', @name, @port, "#{@name}'s bored server")
      Publisher.new.publish(@port, "#{@name} is bored and looking for something to do") 
    end
  end
  
  class LonelyServer
    attr_reader :name, :port

     def initialize(name, port, task)
       @name = name
       @port = port
       @task = task
     end  

     def start
       Bonjour.new.start_listening('_boredjour2._tcp', @name, @port, "#{@name}'s lonely server")
       Publisher.new.publish(@port, "#{@name} is looking for help with '#{@task}'") 
     end
  end
end