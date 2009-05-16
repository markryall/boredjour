require "dnssd"

module BoredJour
  Server  = Struct.new(:name, :host, :port)

  class Bonjour
    def start_listening(service, name, port, message)
       tr = DNSSD::TextRecord.new
       tr['description'] = message

       DNSSD.register(name, service, "local", port, tr.encode) {|reply|}
    end
    
    def each_server service, timeout=5
      waiting_thread = Thread.current

      dns = DNSSD.browse service do |reply|
        DNSSD.resolve reply.name, reply.type, reply.domain do |resolve_reply|
          yield Server.new(reply.name, resolve_reply.target, resolve_reply.port)
        end
      end

      puts "Gathering for up to #{timeout} seconds..."
      sleep timeout
      dns.stop
    end
  end
end