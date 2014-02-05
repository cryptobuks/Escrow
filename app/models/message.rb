class Message
  include Mongoid::Document
  field :name, type: String
  field :phonenumber, type: String
  field :message, type: String
  field :when, type: String

  belongs_to :user

end
