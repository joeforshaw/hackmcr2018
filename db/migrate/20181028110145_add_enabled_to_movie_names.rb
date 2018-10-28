class AddEnabledToMovieNames < ActiveRecord::Migration[5.1]
  def change
    add_column :movie_names, :enabled, :boolean, default: true
  end
end
