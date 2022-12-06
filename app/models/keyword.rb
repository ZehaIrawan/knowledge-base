class Keyword < ApplicationRecord
  belongs_to :user
  validates :query, presence: true, uniqueness: { case_sensitive: false }
end
