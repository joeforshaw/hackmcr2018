class CreateMovieSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_summaries do |t|
      t.string :summary
      t.timestamps
    end
  end
end
