class User < ApplicationRecord
  include PgSearch::Model

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

  scope :sorted, -> { order(last_name: :asc) }

  pg_search_scope :global_search,
                  against: %i[first_name last_name],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

  def self.ransackable_attributes(auth_object = nil)
    ["first_name"]
  end
end
