class User < ApplicationRecord
  MAX_EMAIL_LENGTH = 50
  MAX_NAME_LENGTH = 35
  MAX_LENGTH = 50
  MIN_NUM = 6

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true, length: { maximum: MAX_LENGTH }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: MAX_NAME_LENGTH }
  validates :password,
            presence: true,
            length: { minimum: MIN_NUM }

  before_save :to_lowercase

  # set default role to user  if not set
  def set_default_role
    self.role ||= :user
  end

  private

  def to_lowercase
    email.downcase!
  end

end
