class SmsMessage

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :from, type: String
  field :to, type: String
  field :body, type: String

  field :year, type: String
  field :month, type: String
  field :day, type: String
  field :timehour, type: String
  field :timeminute, type: String
  field :timezone, type: String
  field :ampm, type: String

  belongs_to :user

  def set_time

    year + "-" + month + "-" + day + " " + timehour + ":" + timeminute + " " + ampm + " " + timezone 

  end

  def send_text_message
    
    ts = self.user.twilio_sid
    tt = self.user.twilio_token
    
    sent_to_number = to
    sent_from_number = self.user.twilio_number
	  message_to_send = body

    @twilio_client ||= Twilio::REST::Client.new ts, tt
 
    @twilio_client.account.sms.messages.create(
      
      :from => "#{sent_from_number}",
      :to => "#{sent_to_number}",
      :body => "#{message_to_send}"
    )

   end

end