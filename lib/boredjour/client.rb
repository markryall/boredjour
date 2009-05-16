module BoredJour
  class BoredClient
    def retrieve
      Bonjour.new.each_server('_boredjour._tcp') { |server| yield server }
    end
  end
end
