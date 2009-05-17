require 'socket'

module BoredJour
  class Reader
    include Socket::Constants

    def initialize server
      @server = server
    end

    def message
      socket = Socket.new( AF_INET, SOCK_STREAM, 0 )
      sockaddr = Socket.pack_sockaddr_in( @server.port, @server.host )
      socket.connect( sockaddr )
      socket.readline.chomp
      socket.close
    end
  end
end