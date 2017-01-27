require "aws-sdk"
Aws.config.update({ region: "us-east-1",
                    credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]) })

class Email
  def send
    ses = Aws::SES::Client.new()

    options = {
      source: ENV["PERSONAL_EMAIL"],
      destination: {
        to_addresses: [ENV["PERSONAL_EMAIL"]]
      },
      message: {
        subject: {
          data: "Nintendo Switch Pro Controller",
          charset: "UTF-8",
        },
        body: {
          text: {
            data: "The Nintendo Switch Pro Controller is now available to preorder from amazon.com.  https://www.amazon.com/dp/B01NAWKYZ0",
            charset: "UTF-8",
          },
          html: {
            data: "The Nintendo Switch Pro Controller is now available to preorder from amazon.com.  https://www.amazon.com/dp/B01NAWKYZ0",
            charset: "UTF-8",
          },
        },
      },
    }

    resp = ses.send_email(options)
  end
end
