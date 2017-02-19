class AddCompletedToJobRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :job_requests, :completed, :boolean, default: false
    add_column :job_postings, :completed, :boolean, default: false
  end
end
