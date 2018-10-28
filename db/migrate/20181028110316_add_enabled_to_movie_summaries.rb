class AddEnabledToMovieSummaries < ActiveRecord::Migration[5.1]
  def change
    add_column :movie_summaries, :enabled, :boolean, default: true
  end
end
