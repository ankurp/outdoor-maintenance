json.extract! job_request, :id, :user_id, :job_posting_id, :created_at, :updated_at
json.url job_request_url(job_request, format: :json)