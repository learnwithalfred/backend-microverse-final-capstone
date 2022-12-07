class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true

  # set default role to user  if not set
  def set_default_role
    self.role ||= :user
  end
end
