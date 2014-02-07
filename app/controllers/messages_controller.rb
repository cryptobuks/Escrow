class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    if Message.create(message_params)
      redirect_to action: 'index'
      flash[:notice] = "successfully scheduled message!"
    else
      render action: 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

   def update

    @message = Message.find(params[:id])

    if @message.update message_params
      flash[:notice] = "Successfully updated message!"
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    m = Message.find(params[:id])
    m.destroy
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:name, :phonenumber, :message, :date, :time)
  end

end