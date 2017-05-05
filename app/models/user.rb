class User < ApplicationRecord
  # Assign an API key on create
  # Assign an API key on create
  has_secure_password
  has_secure_token
  before_create :add_token_date

  def add_token_date
    self.token_created_at = Date.today
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end

  def allow_token_to_be_used_only_once
    regenerate_token
    touch(:token_created_at)
  end

  def logout
    invalidate_token
  end

  def self.with_unexpired_token(token, period)
    where(token: token).where('token_created_at >= ?', period).first
  end
  private

  # This method is not available in has_secure_token
  def invalidate_token
    update_columns(token: nil)
    touch(:token_created_at)
  end

end
