require 'twilio-ruby'

class Phone
  class << self
    def call
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.account.calls.create(
        {
          :to => ENV['TO_PHONE_NUMBER'],
          :from => ENV['FROM_PHONE_NUMBER'],
          :url => ENV["TWIML_URL"]
        })
    end
  end
end
