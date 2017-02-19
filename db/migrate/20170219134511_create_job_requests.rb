class CreateJobRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :job_requests do |t|
      t.references :user, foreign_key: true
      t.references :job_posting, foreign_key: true

      t.timestamps
    end
  end
end
