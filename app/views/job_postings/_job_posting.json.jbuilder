json.extract! job_posting, :id, :user_id, :job_type_id, :location_id, :description, :payment_for_job, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)