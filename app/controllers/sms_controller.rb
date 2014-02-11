class SmsController < ApplicationController
  
  def index
    @sms = Sms.all
  end

  def new
    @sms = Sms.new
  end
 
  def send_text_message
 
    twilio_sid = 'AC30ea0b2e26c3293997fbf599981fd28c'
    twilio_token = '0972510307bc4eb384fc54dd4fb2fe2c'
    

    sent_to_number = params[:sms][:to]
    sent_from_number = '13239995226'

    message_to_send = params[:sms][:body]

    @sms = Sms.create(params[:sms].permit(:to, :from, :body))
      
      if @sms.save

        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
 
        @twilio_client.account.sms.messages.create(
          :from => "#{sent_from_number}",
          :to => "#{sent_to_number}",
          :body => "#{message_to_send}"
        )

        flash[:notice] = "Your text has been sent!"
        redirect_to sms_path
      
      else
        render 'new'

    end

  end

end
