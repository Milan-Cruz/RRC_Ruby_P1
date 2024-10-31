# Rails Chuck Norris Jokes

This Ruby on Rails application, created by Milan Cruz, a student at RRC Polytech, allows users to browse, search, and categorize Chuck Norris jokes using data from the [Chuck Norris API](https://api.chucknorris.io/). The application supports random joke generation, category filtering, and includes pagination for joke navigation.

## Dataset Description

This project leverages data from the [Chuck Norris API](https://api.chucknorris.io/), providing random jokes about Chuck Norris along with joke categories.

### Data Source:
- **API**: [https://api.chucknorris.io/](https://api.chucknorris.io/)
- **Endpoints Used**:
  - `/jokes/random`: Fetches a random joke.
  - `/jokes/categories`: Fetches all available categories.
  - `/jokes/random?category={category_name}`: Fetches a random joke from a specific category.

## Structure of the Data

### Jokes:
- **id**: A unique string identifier provided by the API (e.g., "iHdFyVwQTIqpF1DgpoMXlg").
- **joke_text**: The actual text of the joke (e.g., "Chuck Norris can divide by zero.").
- **categories**: An array of category names (e.g., `["animal", "career"]`). A joke can belong to multiple categories.
- **created_at**: The timestamp when the joke was created (e.g., "2020-01-05T13:42:19.576Z").
- **updated_at**: The timestamp when the joke was last updated.
- **icon_url**: The URL of the Chuck Norris icon for the joke.
- **url**: A direct link to the joke on the Chuck Norris website.

### Categories:
- **name**: The name of the category (e.g., "animal").

## Database Tables and Relationships

- **Jokes Table**: Stores joke information, including text, category associations, and API links.
- **Categories Table**: Stores available joke categories.
- **JokesCategories Table**: Facilitates the many-to-many relationship between jokes and categories.

## ERD Diagram (Optional)
> If applicable, add an ERD diagram to visualize the database relationships.

---

### Running the Project

1. **Install Dependencies**: Run `bundle install`.
2. **Setup Database**: Run `rails db:create db:migrate db:seed` to initialize the database with sample data.
3. **Start the Server**: Run `rails server` and navigate to `http://localhost:3000` to explore the app.

---

This project was developed as a learning exercise in Ruby on Rails, utilizing RESTful routes, ActiveRecord relationships, and a third-party API for real-world data.
