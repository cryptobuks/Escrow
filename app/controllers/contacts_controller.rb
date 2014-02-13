class ContactsController < ApplicationController

  def index
  	if current_user
      @contacts = current_user.contacts
    else new_user
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      @contact = Contact.find(params[:id])
    else new_user
      redirect_to new_user_path
    end
  end

  def new
  	if current_user
      @contact = Contact.new
    else new_user
      redirect_to new_user_path
    end
  end

  def create
    if current_user
      @contact = Contact.new(contact_params)
      if @contact.save
        current_user.contacts.push(@contact)
        redirect_to action: 'index'
        flash[:notice] = "successfully created contact!"
      else
        render action: 'new'
      end
    else new_user
      redirect_to new_user_path
    end
  end

  def edit
    if current_user
      @contact = Contact.find(params[:id])
    else new_user
      redirect_to new_user_path
    end
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
