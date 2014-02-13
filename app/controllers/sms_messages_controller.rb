class SmsMessagesController < ApplicationController

  def index
    @sms_messages = SmsMessage.all
  end

  def new
    @sms_message = SmsMessage.new
  end

  def create   

    @sms_message = SmsMessage.create(params[:sms_message].permit(:to, :from, :body))

      if @sms_message.save

        scheduler = Rufus::Scheduler.new
        scheduler.in '1m' do
          @sms_message.send_text_message
        end

        flash[:notice] = "Your text has been scheduled!"
        redirect_to sms_messages_path
      
      else
        render 'new'

    end

end
end
