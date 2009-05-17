require 'socket'

module BoredJour
  class Publisher
    def publish(port, message)
       socket = Socket.new( Socket::Constants::AF_INET, Socket::Constants::SOCK_STREAM, 0 )
       sockaddr = Socket.pack_sockaddr_in( port.to_i, '0.0.0.0' )
       puts "binding to socket #{port}"
       socket.bind( sockaddr )
       
       at_exit do
         socket.close
       end
       
       begin
         while (true) do
           socket.listen( 5 )
           client, client_sockaddr = socket.accept
           client.puts message
         end
       rescue Exception
         puts 'may you live in peace'
       end
    end  
  end
end