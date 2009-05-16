require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe BoredServer do
    before do
      @name = "name"
      @port = 7
      @bonjour = stub('bonjour')
      Notifier.stub!(:say)
      Bonjour.stub!(:new).and_return(@bonjour)
      @bonjour.stub!(:start_listening)
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

    it 'should send notification that it has started' do
      Notifier.should_receive(:say).with('bored server started')
      @server.start
    end
  end
end