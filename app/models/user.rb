class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :members, dependent: :destroy
  has_many :groups_attend, through: :members, source: :groups

  EMAIL_REGEX = /\A[A-Za-z0-9\.]+@[A-Za-z]+\.[A-Za-z]{3}/
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save :downcase_email

  def downcase_email
      self.email.downcase!
  end

end
