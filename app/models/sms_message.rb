class SmsMessage
  include Mongoid::Document
  include Mongoid::Timestamps
  field :from, type: String
  field :to, type: String
  field :body, type: String

  belongs_to :user

  def send_text_message
 
    twilio_sid = current_user.twilio_sid
    twilio_token = current_user.twilio_token
    
    sent_to_number = self.to
    sent_from_number = self.from
	  message_to_send = self.body

    @twilio_client ||= Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "#{sent_from_number}",
      :to => "#{sent_to_number}",
      :body => "#{message_to_send}"
    )

   end

end