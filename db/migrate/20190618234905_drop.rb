class Drop < ActiveRecord::Migration[6.0]
  def change
    drop_table :movie_lists
  end
end
