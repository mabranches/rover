require 'simplecov'
SimpleCov.start do
    add_filter "/spec/"
end

require 'rspec'
require 'byebug'
Dir["./lib/*"].each {|file| require file }
Dir["./models/*"].each {|file| require file }
