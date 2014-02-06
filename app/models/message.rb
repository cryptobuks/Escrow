class Message
  include Mongoid::Document
  field :name, type: String
  field :phonenumber, type: String
  field :message, type: String
  field :date, type: String
  field :time, type: String

  belongs_to :user

end
