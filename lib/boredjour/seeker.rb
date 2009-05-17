module BoredJour
  class Seeker
    def self.each_reader
      Bonjour.new.each_server('_boredjour2._tcp') { |server| yield Reader.new(server) }
    end
  end
end