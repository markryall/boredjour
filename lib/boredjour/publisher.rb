module BoredJour
  class Publisher
    def publish(port, message)
       system "boredjour_ws -p #{port} \"#{message}\""   
    end  
  end
end