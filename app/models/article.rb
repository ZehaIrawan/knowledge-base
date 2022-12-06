class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  before_save :downcase_fields

  def downcase_fields
      self.title.downcase!
   end
end
