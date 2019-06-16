class CreateListsMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :lists_movies do |t|
      t.references :list, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
