class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { in: 2..20 }
  validates :Introduction, length: { maximum: 50 }
  
  has_many :books, dependent: :destroy
  attachment :profile_image
end
