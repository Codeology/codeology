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
    t.integer  "curr_week",              default: 0
    t.integer  "next_week",              default: 0
    t.integer  "interviewing_curr_week", default: 0
    t.integer  "interviewing_next_week", default: 0
    t.integer  "interviewing_limit",     default: 2
    t.string   "activation_digest"
    t.boolean  "activated",              default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
=end

class User < ApplicationRecord
  attr_accessor :activation_token, :reset_token
  before_create :create_activation_digest
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil:true
  has_many :availabilitys

  # scope :leadership_team, -> { where(is_officer: true) }

  # Call this once the registration activation link has been clicked to
  # set activated and clear the confirmation token
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
    # update_attribute(:activated,    true)
    # update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Sends booking email
  def send_booking_emails(other_user, upcoming_interview)
    UserMailer.new_booking(other_user, self, upcoming_interview).deliver_now
  end

  # Sends cancel email
  def send_cancel_emails(other_user, upcoming_interview)
    UserMailer.cancel_booking(self, other_user, upcoming_interview).deliver_now
    UserMailer.cancel_booking(other_user, self, upcoming_interview).deliver_now
  end

  # is_admin controls whether this user should have website administration capabilities
  # i.e. toggling admin for other people, changing account information, etc.
  def toggle_admin
    self.is_admin = !self.is_admin
    save!(:validate => false)
  end

  # Checks if a token has been authenticated (useful for remember, account activation, and PW reset tokens)
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # Checks if token has expired
  def expired?(attribute)
    sent_at = send("#{attribute}_sent_at")
    sent_at < 3.hours.ago
  end

  private

    # Creates a token and its digest and sent time
    #
    # This is called with BEFORE_CREATE,  which happens before user has been created
    # So there's no attribute to update_attribute() with yet! However, as a result of 
    # the callback, when a new user is defined with User.new, it will automatcially get 
    # all 3 attributes; because the last two are associated witha column int he db, it 
    # will be written to the DB automatically when user is saved.
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
        self.activation_sent_at = Time.zone.now
    end

    def reset_activation_digest
      self.activation_token = User.new_token
      update_attributes(:activation_digest=> User.digest(activation_token), :activation_sent_at => Time.zone.now)
    end

    # Generates new token
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
