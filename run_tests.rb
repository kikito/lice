require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/**/*.rb"].each {|file| require file }

Assertor::Reporter.new.run
