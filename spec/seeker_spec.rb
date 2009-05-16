require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe Seeker do
    it 'should create readers from each discovered bonjour server' do
      @bonjour = stub('bonjour')
      Bonjour.stub!(:new).and_return(@bonjour)
      each_server_stub = @bonjour.stub!(:each_server).with('_boredjour._tcp')
      
      readers = []
      (1..3).each do |index|
        server = stub('server#{index}')
        readers << (reader = stub('reader#{index}'))
        each_server_stub.and_yield(server)
        Reader.should_receive(:new).with(server).and_return(reader)
      end
      
      actual_readers = []
      Seeker.each_reader {|reader| actual_readers << reader}
      actual_readers.should == readers
    end
  end
end
