class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minimum: 5}
  has_secure_password

  def self.authenticate_with_credentials(email,password)
    user = User.find_by(email:email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
