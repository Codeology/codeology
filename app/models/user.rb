# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  is_admin        :boolean          default(FALSE)
#  title           :string
#  bio             :text
#  is_officer      :boolean          default(FALSE)
#  email_confirmed :boolean          default(FALSE)
#  confirm_token   :string
#

class User < ApplicationRecord
  before_create :set_confirmation_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  scope :leadership_team, -> { where(is_officer: true) }

  # Call this once the registration activation link has been clicked to
  # set email_confirmed and clear the confirmation token
  def activate_email
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def set_confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end
end
