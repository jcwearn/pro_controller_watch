require "rubygems"
require "headless"
require "watir"

Headless.ly do
  browser = Watir::Browser.new
  browser.goto "https://www.amazon.com/dp/B01NAWKYZ0"

  if /Currently unavailable/.match(browser.text)
    puts "Still unavailable"
  else
    puts "It's finally here"
  end

  browser.close
end
