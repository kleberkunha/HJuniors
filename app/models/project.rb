class Project < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user
end
