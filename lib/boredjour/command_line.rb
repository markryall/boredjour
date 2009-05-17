require 'rubygems'

module BoredJour
  class CommandLine
    def self.run *args      
      case args.shift
        when 'help'
          Notifier.say(help)
        when 'yawn'
          user = args.shift || ENV['USER']
          port = args.shift || 70001
          BoredServer.new(user, port.to_i).start
        when 'yearn'
          message = args.shift
          user = args.shift || ENV['USER']
          port = args.shift || 70001
          LonelyServer.new(user, port.to_i, message).start  
        when 'seek'
          BoredClient.new.each_message{|message| Notifier.say(message)}
        else
          Notifier.say(help)
      end
     end
     
    def self.help
      <<EOF
'boredjour yawn' to tell people you are bored
'boredjour yearn <some task>' to tell people you are lonely and want help with a task
'boredjour seek' to find all the bored and lonely people 
EOF
    end
  end
end
