class User < ApplicationRecord
  has_many :projects, dependent: :delete_all
  has_one_attached :avatar

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
end
