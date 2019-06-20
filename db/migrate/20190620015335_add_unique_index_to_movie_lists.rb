class AddUniqueIndexToMovieLists < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_lists, [:movie_id, :list_id], unique: true
  end
end
