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

      @sms_message = SmsMessage.new(params[:sms_message].permit(:to, :from, :body).merge(user_id:current_user.id))

        if @sms_message.save

          # scheduler = Rufus::Scheduler.new
          # scheduler.in '0m' do
          @sms_message.send_text_message
          # end

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
