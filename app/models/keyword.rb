class Keyword < ApplicationRecord
  belongs_to :user
  validates :query, presence: true
  validate :check_if_user_already_has_keyword

  def check_if_user_already_has_keyword
    keywords = Keyword.where(user:@user).where("query like ?", "%#{self.query}%").any?
     p "LOOK AT CONSOLE #{keywords}"
    if keywords
      return false
    end
    return true
  end

end
