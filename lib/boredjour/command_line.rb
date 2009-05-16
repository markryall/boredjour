module BoredJour
  class CommandLine
    def self.run *args
      cmd = args.shift

      case cmd
      when 'help'
        Notifier.say(help)
      else
        Notifier.say(help)
      end
    end
    
    def self.help
      "You bastard\n"
    end
  end
end
