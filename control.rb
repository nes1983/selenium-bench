#!/usr/bin/env ruby -wKU
require 'rubygems'
require 'better-benchmark'
 
 
def selenium(port)
    pids = Array.new
    1.times {
        ENV['PORT']=port.to_s
        pids << fork {
         `rspec sushi_selenium.rb`
        }
    }
    pids.each {|el|
        Process.wait(el)
    }
end


 
result = Benchmark.compare_realtime(:iterations => 1) { |iteration|
    #selenium(8088)
}.with { |iteration|
    selenium(9090)
}


ENV['R_HOME']="/Library/Frameworks/R.framework/Resources"
Benchmark.report_on result