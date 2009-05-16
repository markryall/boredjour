require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour
  describe CommandLine do
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
end