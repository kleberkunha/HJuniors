class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :project_id }

  belongs_to :user
  belongs_to :project
end
