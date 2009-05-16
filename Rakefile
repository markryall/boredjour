require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.warning = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "boredjour"
    gemspec.summary = "A *jour for the bored"
    gemspec.email = "mark@ryall.name"
    gemspec.homepage = "http://github.com/markryall/boredjour"
    gemspec.description = "A bonjour server/client for discovering the bored"
    gemspec.files = FileList["README", "{bin,lib}/**/*"]
    gemspec.authors = ["Mark Ryall", "Perryn Fowler"]
    gemspec.rubyforge_project = 'gratis'
    gemspec.executables      = %w(boredjour boredjour_ws)
    gemspec.add_dependency "dnssd", ">= 0.6.0"
    gemspec.add_dependency "sinatra", ">= 0.9.1.1"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end