require 'socket'

module BoredJour
  class Publisher
    include Socket::Constants
    def publish(port, message)
       socket = Socket.new(AF_INET, SOCK_STREAM, 0)
       sockaddr = Socket.pack_sockaddr_in( port.to_i, '0.0.0.0')
       socket.bind( sockaddr )
       
       at_exit do
         socket.close
       end
       
       begin
         while (true) do
           socket.listen( 5 )
           client_socket, client_sockaddr = socket.accept
           client_socket.puts message
         end
       rescue Exception
         puts 'may you live in peace'
       end
    end  
  end
end