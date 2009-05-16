require "dnssd"

module BoredJour
  Server  = Struct.new(:name, :host, :port)

  class Bonjour
    def start_listening(service, name, port, message)
       tr = DNSSD::TextRecord.new
       tr['description'] = message

       puts 'starting server'
       DNSSD.register(name, service, "local", port, tr.encode) {|reply|}
    end
    
    def each_server service, timeout=3
      dns = DNSSD.browse service do |reply|
        puts "received reply #{reply.name} #{reply.domain}"
        DNSSD.resolve reply.name, reply.type, reply.domain do |resolve_reply|
          puts "received resolve_reply #{resolve_reply.target}:#{reply.port}"
          yield Server.new(reply.name, resolve_reply.target, resolve_reply.port)
        end
      end

      sleep timeout
      dns.stop
    end
  end
end