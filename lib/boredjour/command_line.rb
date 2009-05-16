require 'rubygems'
require 'sinatra'
module BoredJour
  class CommandLine
    
  
        
    def self.run *args      
      cmd = args[0]

      case cmd
        when 'help'
          Notifier.say(help)
      when 'yawn'
        port = args[2].nil??70001:args[2]
        BoredServer.new(args[1].nil??ENV['USER']:args[1], port).start
       when 'yearn'
        port = args[3].nil??70001:args[3]
        LonelyServer.new(args[2].nil??ENV['USER']:args[2], port, args[1]).start  
      when 'seek'
        BoredClient.new.each_message{|message| Notifier.say(message)}
      else
        Notifier.say(help)
      end
     end
     
    def self.help
      "You bastard\n"
    end
  end
end
