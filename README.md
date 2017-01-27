# Pro Controller Watcher
A Simple ruby script used to monitor the availabilty of the Nintendo Switch Pro Controller on Amazon.

## Dependecies

Run `bundle install` to install gem dependencies.

The `headless` gem also requires that xvfb is installed.

To do this run `sudo apt-get install xvfb`

## Environment Variables
`AWS_ACCESS_KEY_ID="YOUR_KEY_GOES_HERE"`
`AWS_SECRET_ACCESS_KEY="YOUR_SECRET_GOES_HERE"`
`PERSONAL_EMAIL="YOUR_EMAIL_GOES_HERE"`

## Additional Setup
This script uses Amazon Simple Email Service.
For the script to successfully send an email, you must verify the email set in the above environment variable.
This is a simple process explained in detail in [Amazon's Documentation](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html).

## Usage
`ruby watch.rb` will run the script and output the availabilty of the switch.

## Crontab
