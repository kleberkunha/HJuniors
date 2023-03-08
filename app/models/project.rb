class Project < ApplicationRecord
  include PgSearch::Model
  has_one_attached :avatar
  belongs_to :user

  scope :sorted, -> { order(name: :asc) }
  pg_search_scope :global_search,
                  against: %i[name],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
