class SmsMessagesController < ApplicationController

  def index
    if current_user
      @sms_messages = current_user.sms_messages
    else new_user
      redirect_to new_user_path
    end
  end

  def new
    if current_user
      @sms_message = SmsMessage.new
    else new_user
      redirect_to new_user_path
    end
  end

  def create   
    if current_user

      @sms_message = current_user.sms_messages.build(params[:sms_message].permit(:to, :from, :body))

        if @sms_message.save

          #scheduler = Rufus::Scheduler.new
          #scheduler.at '2014-02-14 15:35 Pacific Time Zone' do
          @sms_message.send_text_message
          #end

          flash[:notice] = "Your text has been scheduled!"
          redirect_to sms_messages_path
      
        else
          render 'new'
        end

    else new_user
      redirect_to new_user_path
    end

  end

end
