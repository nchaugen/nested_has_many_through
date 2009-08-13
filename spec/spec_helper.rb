# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
# ENV["RAILS_ENV"] ||= "test"
# require File.expand_path(File.join(File.dirname(__FILE__), "../../../../config/environment"))
require 'rubygems'

# require 'spec/rails'

require 'spec'
require 'rubygems'
require 'active_record'


Spec::Runner.configure do |config|
  
  config.before(:suite) do
    # ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/log/test.log")
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    load(File.dirname(__FILE__) + "/db/schema.rb")
    
    $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
    require File.expand_path(File.dirname(__FILE__) + '/../init')
  end

  # config.before(:each) do
  #   # We need to truncate the database before each spec
  #   ActiveRecord::Base.connection.tables.each do |table|
  #    ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  #    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
  #   end
  # end
  
  # You can declare fixtures for each behaviour like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so here, like so ...
  #
  #   config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
end