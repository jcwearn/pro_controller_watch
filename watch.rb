require "date"
require 'dotenv/load'
require "headless"
require "watir"
require_relative "email"
require_relative "phone"

Dotenv.overload

Headless.ly do
  browser = Watir::Browser.new
  browser.goto "https://www.amazon.com/dp/B01NAWKYZ0"

  if /Currently unavailable/.match(browser.text)
    puts "Still unavailable as of #{DateTime.now}"
  else
    puts "It's finally here"
    Email.send
    Phone.call
  end

  browser.close
end
