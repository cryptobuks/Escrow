class SmsMessage

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :from, type: String
  field :to, type: String
  field :body, type: String

  belongs_to :user

  def send_text_message(sender)
    
    ts = sender.twilio_sid
    tt = sender.twilio_token
    
    sent_to_number = to
    sent_from_number = sender.twilio_number
	  message_to_send = body

    @twilio_client ||= Twilio::REST::Client.new ts, tt
 
    @twilio_client.account.sms.messages.create(
      
      :from => "#{sent_from_number}",
      :to => "#{sent_to_number}",
      :body => "#{message_to_send}"
    )

   end

end