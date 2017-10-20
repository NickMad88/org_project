class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :user_members, through: :members, source: :user
  validates :name, :description, presence: true
  
end
