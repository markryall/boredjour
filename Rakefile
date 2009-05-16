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
    gemspec.files = FileList["[A-Z]*", "{lib,spec}/**/*.{rb,cs}"]
    gemspec.authors = ["Mark Ryall"]
    gemspec.rubyforge_project = 'gratis'
    gemspec.executables      = %w(boredjour)
    gemspec.add_dependency "dnssd", ">= 0.6.0"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end