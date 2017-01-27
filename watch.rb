require "rubygems"
require "headless"
require "watir"
require_relative "email"

Headless.ly do
  browser = Watir::Browser.new
  browser.goto "https://www.amazon.com/dp/B01NAWKYZ0"

  if /Currently unavailable/.match(browser.text)
    puts "Still unavailable"
  else
    puts "It's finally here"
    Email.send
  end

  browser.close
end
