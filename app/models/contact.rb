class Contact
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :phonenumber, type: String
  
  belongs_to :user
  
end