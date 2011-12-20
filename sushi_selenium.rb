require 'rubygems'
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "SushiSelenium" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:" + ENV['PORT'].to_s
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_sushi_selenium" do
    3.times {
        @driver.get(@base_url + "/store")
    @driver.find_element(:link, "Browse").click
    @driver.find_element(:link, "Akagai").click
    @driver.find_element(:name, "3").click
    @driver.find_element(:link, "Browse").click
    @driver.find_element(:link, "2").click
    @driver.find_element(:link, "Hotategai").click
    @driver.find_element(:name, "4").click
    @driver.find_element(:name, "5").click
    @driver.find_element(:link, "5").click
    @driver.find_element(:link, "4").click
    @driver.find_element(:link, "Sake").click
    @driver.find_element(:name, "4").click
    @driver.find_element(:name, "5").click
    @driver.find_element(:link, "Checkout").click
    @driver.find_element(:name, "2").click
    @driver.find_element(:xpath, "//div[@id='cart']/table/tbody/tr[3]/td/a").click
    @driver.find_element(:link, "Browse").click
    @driver.find_element(:link, "Anago").click
    @driver.find_element(:name, "4").click
    @driver.find_element(:name, "5").click
    @driver.find_element(:link, "Checkout").click
    @driver.find_element(:name, "1").click
    @driver.find_element(:name, "3").clear
    @driver.find_element(:name, "3").send_keys "Sherlock"
    @driver.find_element(:name, "4").clear
    @driver.find_element(:name, "4").send_keys "221B Baker Street"
    @driver.find_element(:name, "5").clear
    @driver.find_element(:name, "5").send_keys "London"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "6")).select_by(:text, "USA")
    @driver.find_element(:name, "7").click
    @driver.find_element(:name, "3").click
    @driver.find_element(:name, "4").clear
    @driver.find_element(:name, "4").send_keys "Sherlock"
    @driver.find_element(:name, "5").clear
    @driver.find_element(:name, "5").send_keys "1337"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "7")).select_by(:text, "2012")
    @driver.find_element(:name, "8").click
    }
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
