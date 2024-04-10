class User < ApplicationRecord

  has_secure_password

  validates :password, presence: { on: create }, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    # Find the user by email. You might want to adjust this to handle case sensitivity or leading/trailing spaces.
    user = User.find_by(email: email)

    # If a user is found and the password matches, return the user; otherwise, return nil
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  before_save :downcase_email
  before_validation :strip_whitespace_from_email


  private

  def downcase_email
    self.email.downcase!
  end

  def strip_whitespace_from_email
    self.email = email.strip unless email.nil?
  end

end