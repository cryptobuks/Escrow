require 'rubygems'
require 'twilio-ruby'
 
class Text

# attr_accessor :account_sid, :auth_token, :body, :to, :from

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC30ea0b2e26c3293997fbf599981fd28c'
auth_token = '0972510307bc4eb384fc54dd4fb2fe2c'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.sms.messages.create(:body => "maybe our friend molly will be at avalon this friday. we should invite her.",
    :to => "+13103830801",     # Replace with your phone number
    :from => "+13239995226")   # Replace with your Twilio number
puts message.sid

end