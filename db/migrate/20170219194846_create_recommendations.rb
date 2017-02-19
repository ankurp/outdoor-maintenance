class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :recommender, index: true

      t.timestamps
    end

    add_foreign_key :recommendations, :users, column: :recommender_id
  end
end
