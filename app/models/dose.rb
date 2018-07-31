class Dose < ApplicationRecord
  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
  # cocktail or cocktail_id?
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end

