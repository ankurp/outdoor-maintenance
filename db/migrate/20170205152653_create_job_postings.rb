class CreateJobPostings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_postings do |t|
      t.references :user, foreign_key: true
      t.references :job_type, foreign_key: true
      t.references :location, foreign_key: true
      t.string :description
      t.integer :payment_for_job

      t.timestamps
    end
  end
end
