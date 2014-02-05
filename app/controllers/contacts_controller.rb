class ContactsController

  def index
  	@contacts = Contact.all
  end

  def show
  	@show = Contact.find(params[:id])

  def new
  	@contact = Contact.new
  end

  def create
  	Contact.create(params[:contact].permit(:firstname, :lastname, :email, :username, :password_digest, :phonenumber))
  end

end