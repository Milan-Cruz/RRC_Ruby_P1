class Category < ApplicationRecord
  has_and_belongs_to_many :jokes

  # Validations
  validates :name, presence: true, uniqueness: true
end
