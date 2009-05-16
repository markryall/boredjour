require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe CommandLine, 'usage' do
    it 'should print usage with no input' do
      Notifier.should_receive(:say).with(<<EOF)
You bastard
EOF
      CommandLine.run
    end
        
    it 'should print usage when asked for help' do
      Notifier.should_receive(:say).with(<<EOF)
You bastard
EOF
      CommandLine.run "help"
    end
  end

  describe CommandLine, 'when asked to yawn' do
    before do
      @server = stub('server')
      @user = stub('a user')
      @port = stub('a port')
      BoredServer.stub!(:new).and_return(@server)
      @server.stub!(:start)
    end

    it 'should create a server' do
      BoredServer.should_receive(:new).with(@user, @port).and_return(@server)
      CommandLine.run "yawn", @user, @port
    end
    
    it 'should use default port if one is not provided' do
      BoredServer.should_receive(:new).with(@user, 70001).and_return(@server)
      CommandLine.run "yawn", @user
    end

    it 'should default to user from environment' do
      ENV.should_receive(:[]).with('USER').and_return(@user)
      BoredServer.should_receive(:new).with(@user, 70001).and_return(@server)
      CommandLine.run "yawn"
    end
    
    it 'should start the server' do
      @server.should_receive(:start)
      CommandLine.run "yawn"
    end
  end
  
  describe CommandLine, 'when asked to seek' do
    before do
      @client = stub('client')
      # @user = stub('a user')
      #    @port = stub('a port')
      BoredClient.stub!(:new).and_return(@client)
      @client.stub!(:each_message)
      Notifier.stub!(:say)
    end

    it 'should create a client' do
      BoredClient.should_receive(:new).and_return(@client)
      CommandLine.run "seek"
    end
    
    it 'should retrieve and display messages from client' do
      @client.should_receive(:each_message).and_yield("hi")
      Notifier.should_receive(:say).with("hi")
      CommandLine.run "seek"
    end  
    
  end
end