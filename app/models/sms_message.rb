class SmsMessage
  include Mongoid::Document
  include Mongoid::Timestamps
  field :from, type: String
  field :to, type: String
  field :body, type: String

  belongs_to :user

  def send_text_message
 
    ts = current_user.twilio_sid#'AC30ea0b2e26c3293997fbf599981fd28c' #current_user.twilio_sid
    tt = current_user.twilio_token #'0972510307bc4eb384fc54dd4fb2fe2c' #current_user.twilio_token
    
    sent_to_number = self.to
    sent_from_number = current_user.twilio_number#'13239995226' #current_user.twilio_number
	  message_to_send = self.body

    @twilio_client ||= Twilio::REST::Client.new ts, tt
 
    @twilio_client.account.sms.messages.create(
      
      :from => "#{sent_from_number}",
      :to => "#{sent_to_number}",
      :body => "#{message_to_send}"
    )

   end

end