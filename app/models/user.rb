require 'bcrypt'
class User
  include Mongoid::Document

  attr_accessor :password

  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String
  field :twilio_number, type: String
  field :twilio_sid, type: String
  field :twilio_token, type: String
  field :timezone, type: String
  field :admin, type: Mongoid::Boolean

  has_many :contacts
  has_many :sms_messages

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }


  def authenticated? pwd
    self.hashed_password ==
      BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  before_save :hash_stuff

  private
    def hash_stuff
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = 
        BCrypt::Engine.hash_secret self.password, self.salt
      self.password = nil
    end
end

