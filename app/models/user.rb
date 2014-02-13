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
  field :phonenumber, type: String
  field :admin, type: Mongoid::Boolean

  has_many :contacts
  has_many :sms_messages

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :phonenumber, presence: true, uniqueness: true


  def authenticated? pwd
    self.hashed_password ==
      BCrypt::Engine.hash_secret(pwd, self.salt)
      # Replace with BCrypt::Password.new(pwd)
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

