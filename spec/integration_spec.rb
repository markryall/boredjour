require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe BoredServer do
    it 'should find start server after starting it' do
      name = "name"
      port = 7
      @server = BoredServer.new(name,port)
      @server.start

      @client = BoredClient.new
      servernames = []
      @client.retrieve {|server| servernames << server.name}
      servernames.should include(name)
    end
  end
end