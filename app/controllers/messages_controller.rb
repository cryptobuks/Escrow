class MessagesController < ApplicationController
  
  def index
  	@messages = Message.all
  end

  def show
  	@show = Message.find(params[:id])

  def new
  	@message = Message.new
  end

  def create
  	Message.create(params[:message].permit(:phonenumber, :message, :when))
  end

end