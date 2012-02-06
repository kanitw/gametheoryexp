class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  #below here are old code from old guide

  #attr_accessor :password
  
  # email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validates :name,  :presence => true,
  #                   :length   => { :maximum => 50 }
  # validates :email, :presence => true,
  #                   :format   => { :with => email_regex },
  #                   :uniqueness => true
  # validates :password, :unless => "password.blank?",
  #           :confirmation => true,
  #           :length       => { :within => 6..40 }

  

  # before_save :encrypt_password, :unless => "password.blank?"

  # def has_password?(submitted_password)
  #     encrypted_password == encrypt(submitted_password)
  # end
  
  # def self.authenticate(email, submitted_password)
  #     user = find_by_email(email)
  #     return nil  if user.nil?
  #     return user if user.has_password?(submitted_password)
  # end
  
  # def self.authenticate_with_salt(id, cookie_salt)
  #     user = find_by_id(id)
  #     (user && user.salt == cookie_salt) ? user : nil
  # end
  
  # private
  #   def encrypt_password
  #     self.salt = make_salt unless has_password?(password)
  #     self.encrypted_password = encrypt(password)
  #   end

  #   def encrypt(string)
  #     secure_hash("#{salt}--#{string}")
  #   end

  #   def make_salt
  #     secure_hash("#{Time.now.utc}--#{password}")
  #   end

  #   def secure_hash(string)
  #     Digest::SHA2.hexdigest(string)
  #   end
end
