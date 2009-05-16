require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe BoredClient do    
    
    it 'should from all readers found by the seeker ' do
      @client = BoredClient.new
      
      @reader = stub("reader")
      Seeker.should_receive(:each_reader).and_yield(@reader)
      @reader.should_receive(:message).and_return("a message")
       
      @client.each_message{|message| message.should eql("a message")}
    end
  end
end