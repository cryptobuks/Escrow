class ContactsController < ApplicationController

  def index
  	@contacts = current_user.contacts
  end

  def show
    @contact = Contact.find(params[:id])

    #if current_user.contacts

  end

  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      current_user.contacts.push(@contact)
      redirect_to action: 'index'
      flash[:notice] = "successfully created contact!"
    else
      render action: 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

   def update

    @contact = Contact.find(params[:id])

    if @contact.update contact_params
      flash[:notice] = "Successfully updated contact!"
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    c = Contact.find(params[:id])
    c.destroy
    redirect_to contacts_path
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :phonenumber)
  end

end
