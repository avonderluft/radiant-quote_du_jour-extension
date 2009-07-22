require 'active_record/fixtures'
  class LoadSomeQuotes < ActiveRecord::Migration
    def self.up
      down
      directory = File.join(File.dirname(__FILE__), "data")
      Fixtures.create_fixtures(directory, "quotes")
    end
    def self.down
      Quote.delete_all
    end
end