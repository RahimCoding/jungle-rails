class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email,password)
    if(email)
    user = User.find_by_email(email.strip.downcase) 

    if(user && user.authenticate(password))
      return user
    end
  end

  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, :length => {:minimum => 8 }
  validates :password_confirmation, presence: true
end
