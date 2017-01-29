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
    send_alerts if should_alert?
  end

  browser.close
end

def should_alert?
  call_count = File.read("call_count").to_i
  unless (call_count > 14)
    File.open("call_count", "w") do |f|
      f.puts call_count + 1
    end
    true
  else
    false
  end
end

def send_alerts
  Email.send
  Phone.call
end
