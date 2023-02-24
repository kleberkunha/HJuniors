class User < ApplicationRecord
  has_many :projects, dependent: :delete_all
  has_many :degrees
  has_many :coding_languages
  has_many :jobs

  has_one_attached :avatar

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
end
