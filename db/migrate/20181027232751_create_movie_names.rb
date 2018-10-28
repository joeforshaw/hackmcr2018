class CreateMovieNames < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_names do |t|
      t.string :name
      t.timestamps
    end
  end
end
