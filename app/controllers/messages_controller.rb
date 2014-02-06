class MessagesController < ApplicationController
  
  def index
  	@messages = Message.all
  end

  def show
  	@show = Message.find(params[:id])
  end

  def new
  	@message = Message.new
  end

  def create
  	Message.create(params[:message].permit(:name, :phonenumber, :message, :date, :time))
    redirect_to messages_path
  end

end