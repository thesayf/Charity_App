class User < ApplicationRecord
  has_secure_password
  self.abstract_class = true

  before_save do
    name.downcase!
  end

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
