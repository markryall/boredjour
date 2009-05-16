require File.join(File.dirname(__FILE__), 'spec_helper')

module BoredJour 
describe "The Boredjour System" do
  it "should allow a bored person to share their pain" do
    CommandLine.run "yawn", "tommy"
    CommandLine.should_receive(:puts).with("tommy is bored and looking for something to do")
    CommandLine.run "seek"
  end
  
  it "should allow a lonely person to seek companionship" do
    CommandLine.run "yearn", "tommy" , "finding my banana"
    CommandLine.should_receive(:puts).with("tommy is looking for help with 'finding my banana'")
    CommandLine.run "seek"
  end

  it "should Elenor Rigby" do
     CommandLine.run "yearn", "paul" , "my messy divorce"
     CommandLine.run "yawn",  "john" 
     CommandLine.run "yearn", "ringo" , "thomas the tank engine"
     CommandLine.run "yawn",  "george" 
     CommandLine.should_receive(:puts).with("paul is looking for help with 'my messy divorce'")
     CommandLine.should_receive(:puts).with("john is bored and looking for something to do")
     CommandLine.should_receive(:puts).with("ringo is looking for help in 'thomas the tank engine'")
     CommandLine.should_receive(:puts).with("george is bored and looking for something to do")
     CommandLine.run "seek"
   end   
end
end
