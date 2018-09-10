# == Schema Information
=begin
# Table name: users
#
# id              :integer          not null, primary key
  t.string   "name"
  t.string   "email"
  t.datetime "created_at",                             null: false
  t.datetime "updated_at",                             null: false
  t.string   "password_digest"
  t.boolean  "is_admin",               default: false
  t.string   "title"
  t.text     "bio"
  t.boolean  "is_officer",             default: false
  t.boolean  "email_confirmed",        default: false
  t.string   "confirm_token"
  t.integer  "curr_week",              default: 0
  t.integer  "next_week",              default: 0
  t.integer  "interviewing_curr_week", default: 0
  t.integer  "interviewing_next_week", default: 0
  t.integer  "interviewing_limit",     default: 2
  t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
=end

class User < ApplicationRecord
  before_create :set_confirmation_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  # scope :leadership_team, -> { where(is_officer: true) }

  # Call this once the registration activation link has been clicked to
  # set email_confirmed and clear the confirmation token
  def activate_email
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  # is_officer controls whether the user is currently active on the leadership team
  # i.e. President, Alumni Relations, Web Dev Chair, etc.
  def toggle_officer
    self.is_officer = !self.is_officer
    save!(:validate => false)
  end

  # is_admin controls whether this user should have website administration capabilities
  # i.e. toggling admin for other people, changing account information, etc.
  def toggle_admin
    self.is_admin = !self.is_admin
    save!(:validate => false)
  end

  private

  def set_confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end
end
