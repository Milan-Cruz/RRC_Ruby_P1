class CreateJoinTableJokesCategories < ActiveRecord::Migration[7.2]
  def change
    create_join_table :jokes, :categories do |t|
      # t.index [:joke_id, :category_id]
      # t.index [:category_id, :joke_id]
    end
  end
end
