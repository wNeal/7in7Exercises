#!/usr/bin/env ruby
#################################################
# Author: Weston Neal
# Date: 5/21/2012
# Desctipion: 
#    Day 3
#################################################


# Challenge 1
#################################################################
# Modify the CSV application to support an each method to return
# a CsvRow object. Use method_missing on that CsvRow to return
# the value for the column for a given heading
#################################################################

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
        puts 'No each method fur u'
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|t| 
    puts t 
}
