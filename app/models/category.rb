class Category < ApplicationRecord
  # Associations
  has_many :jokes_categories, dependent: :destroy
  has_many :jokes, through: :jokes_categories

  # Validations
  validates :name, presence: true, uniqueness: true
end
