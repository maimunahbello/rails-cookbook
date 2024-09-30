class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :comment, presence: true, length: { minimum: 6, too_short: 'must have at least 6 characters' }
  validates :recipe_id, uniqueness: { scope: :category_id}
end
