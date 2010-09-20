require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "jquery_autocomplete"
    gemspec.summary = "rails autocomplete using jQuery-UI widget"
    gemspec.description = "Adds autocomplete support to rails inputs, using jQuery-UI; it " +
                      "works similarly to the original rails autocomplete plugin, but " +
                      "generating unobtrusive javascript."
    gemspec.email = "michele.franzin@gmail.com"
    gemspec.homepage = "http://github.com/michelefranzin/jquery_autocomplete"
    gemspec.authors = ["Michele Franzin"]

    gemspec.add_development_dependency 'yard', '>=0.5.4'
    gemspec.add_dependency 'rails', '>=2.1'
    gemspec.files.exclude '*install.rb'
    gemspec.files.exclude '.gitignore'
    gemspec.files.exclude 'javascripts/*'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

