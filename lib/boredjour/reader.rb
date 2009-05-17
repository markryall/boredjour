require 'socket'

module BoredJour
  class Reader
    include Socket::Constants

    def initialize server
      @server = server
    end

    def message
      begin
        socket = TCPSocket.new(@server.host, @server.port)
        message=socket.readline.chomp
        socket.close
        message
      rescue Exception => e
        puts e.message
      end
    end
  end
end