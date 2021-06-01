class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase) 
    #email.strip.downcase removes spaces from the first and last index and also makes the string into the lowercase.

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end
  
end
