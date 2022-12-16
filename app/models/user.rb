class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  VALID_EMAIL_REGEX = /\A([\w+-].?)+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_EMAIL_LENGTH = 250
  MAX_NAME_LENGTH = 100
  MIN_NUM = 6
  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: MAX_EMAIL_LENGTH },
            format: { with: VALID_EMAIL_REGEX }
  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: MIN_NUM }
  before_save :to_lowercase

  # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  # set default role to user  if not set
  def set_default_role
    self.role ||= :user
  end

  private

  def to_lowercase
    email.downcase!
  end
end
