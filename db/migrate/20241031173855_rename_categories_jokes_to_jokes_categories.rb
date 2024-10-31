class RenameCategoriesJokesToJokesCategories < ActiveRecord::Migration[7.2]
  def change
    rename_table :categories_jokes, :jokes_categories
  end
end
