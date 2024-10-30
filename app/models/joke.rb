class Joke < ApplicationRecord
  has_and_belongs_to_many :categories
  validates :joke_text, presence: true, uniqueness: true
end
