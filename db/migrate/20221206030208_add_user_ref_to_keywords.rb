class AddUserRefToKeywords < ActiveRecord::Migration[7.0]
  def change
    add_reference :keywords, :user, null: false, foreign_key: true
  end
end
