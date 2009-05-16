require "net/http"

module BoredJour
  class Reader
    def initialize server
      @server = server
    end

    def message
     Net::HTTP.start(@server.host, @server.port) { |http| http.get('/') }.body
    end
  end
end