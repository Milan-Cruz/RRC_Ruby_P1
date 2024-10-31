class Joke < ApplicationRecord
  # Associations
  has_many :jokes_categories, dependent: :destroy
  has_many :categories, through: :jokes_categories

  # Validations
  validates :joke_text, presence: true, uniqueness: true
  validates :api_id, presence: true, uniqueness: true
end
