class CreateJokes < ActiveRecord::Migration[7.2]
  def change
    create_table :jokes do |t|
      t.text :joke_text
      t.string :api_id
      t.string :icon_url
      t.string :url

      t.timestamps
    end
  end
end
