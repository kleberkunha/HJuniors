class User < ApplicationRecord
  has_many :projects, dependent: :delete_all

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
end
