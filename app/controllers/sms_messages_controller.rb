class SmsMessagesController < ApplicationController


  def index
    if current_user
      @sms_messages = current_user.sms_messages
    else new_user
      redirect_to new_user_path
    end
  end

  def show
      @sms_message = SmsMessage.find(params[:id])
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

      @sms_message = current_user.sms_messages.build(sms_message_params)
      
      if @sms_message.save

          scheduler = Rufus::Scheduler.new
          scheduler.at @sms_message.set_time do
            @sms_message.send_text_message
          end

        flash[:notice] = "Your text has been scheduled!"
        redirect_to sms_messages_path

      else
        render 'new'
      end

    else new_user
      redirect_to new_user_path
    end

  end

  def edit
    @sms_message = SmsMessage.find(params[:id])
  end

  def update

    @sms_message = SmsMessage.find(params[:id])

    if @sms_message.update sms_message_params
      flash[:notice] = "Successfully updated SMS!"
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    s = SmsMessage.find(params[:id])
    s.destroy
    redirect_to users_path
  end

  private
  
    def sms_message_params
      params.require(:sms_message).permit(:from, :to, :body, :month, :day, :year, :timehour, :timeminute, :ampm, :timezone)
    end

end
