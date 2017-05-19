class Cocktail < ApplicationRecord
  has_attachments :photos, maximum: 3
  has_many :ingredients, through: :doses
  has_many :doses , dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
