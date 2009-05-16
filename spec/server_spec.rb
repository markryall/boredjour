require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe BoredServer, 'during initialization' do
    it 'should default to port 10007' do
      name = 'name'
      server = BoredServer.new(name, 10007)
      server.port.should == 10007
      server.name.should == name
    end
  end
  
  describe BoredServer do
    before do
      @name = "name"
      @port = 7
      @bonjour = stub('bonjour')
      @publisher = stub('sinatra')
      Notifier.stub!(:say)
      Bonjour.stub!(:new).and_return(@bonjour)
      Publisher.stub!(:new).and_return(@publisher)
      @bonjour.stub!(:start_listening)
      @publisher.stub!(:publish)
      @server = BoredServer.new(@name,@port)
    end

    it 'should create a bonjour' do
      Bonjour.should_receive(:new).and_return(@bonjour)
      @server.start
    end

    it 'should tell bonjour to start listening' do
      @bonjour.should_receive(:start_listening).with('_boredjour._tcp', @name, @port, "name's bored server")
      @server.start
    end

     it 'should tell publish to publish a bored message' do
        @publisher.should_receive(:publish).with(@port, "name is bored and looking for something to do")
        @server.start
      end

    it 'should send notification that it has started' do
      Notifier.should_receive(:say).with('bored server started')
      @server.start
    end
  end
end