class Contact
  include Mongoid::Document
  field :name, type: String
  field :phonenumber, type: String
  
  belongs_to :user
  
end