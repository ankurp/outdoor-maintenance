class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :recommender,
              foreign_key: :recommender_id,
              class_name: 'User'

end
