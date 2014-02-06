class ContactsController < ApplicationController

  def index
  	@contacts = Contact.all
  end

  def show
  	@show = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
  end

  def create
  	Contact.create(params[:contact].permit(:name, :phonenumber))
    redirect_to contacts_path
  end

end