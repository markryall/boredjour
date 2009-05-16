module BoredJour
  class BoredClient    
    def each_message
      Seeker.each_reader {|r| yield r.message}
    end
  end
end
