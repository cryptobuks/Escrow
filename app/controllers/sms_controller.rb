class SmsController < ApplicationController
  
  # def deliver
  #   Sms.update(params[:id], :scheduled_at => Time.now)
  #   flash[:notice] = "Delivering mailing"
  #   redirect_to sms_path
  # end

  def index
    @sms = Sm.all
  end

  def new
    @sms = Sm.new
  end

  
      
  def create   

  @sms = Sm.create(params[:sm].permit(:to, :from, :body))

      if @sms.save

        #@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
 
        #@twilio_client.account.sms.messages.create(
         # :from => "#{sent_from_number}",
          #:to => "#{sent_to_number}",
          #:body => "#{message_to_send}"
        #)

        flash[:notice] = "Your text has been scheduled!"
        @sms.send_text_message
        redirect_to sms_path
      
      else
        render 'new'

    end

end
end
