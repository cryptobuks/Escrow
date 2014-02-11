class Sms
  include Mongoid::Document
  include Mongoid::Timestamps
  field :from, type: String
  field :to, type: String
  field :body, type: String
end