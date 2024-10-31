class Joke < ApplicationRecord
  has_and_belongs_to_many :categories

  # Validations
  validates :joke_text, presence: true, uniqueness: true
  validates :api_id, presence: true, uniqueness: true
end
