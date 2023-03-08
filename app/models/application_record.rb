class ApplicationRecord < ActiveRecord::Base
  include PgSearch::Model
  primary_abstract_class

  scope :sorted, -> { order(first_name: :asc) }

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
