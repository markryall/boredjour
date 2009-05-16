require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe BoredClient do    
    it "should retrieve list of current server instances" do
      @servers = [stub('server1'),stub('server2')]
      @bonjour = stub('bonjour')
      Bonjour.stub!(:new).and_return(@bonjour)
      each_server_stub = @bonjour.stub!(:each_server).with('_boredjour._tcp')
      @servers.each {|server| each_server_stub.and_yield(server) }

      @client = BoredClient.new
      actual_servers = []
      @client.retrieve {|server| actual_servers << server}
      actual_servers.should == @servers
    end
  end
end