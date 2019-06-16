class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :name

      t.timestamps
    end
    add_index :movies, [:name]
  end
end
