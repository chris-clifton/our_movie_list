class CreateMovieLists < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_lists do |t|

      t.belongs_to :list, index: true
      t.belongs_to :movie, index: true

      t.timestamps
    end
  end
end
