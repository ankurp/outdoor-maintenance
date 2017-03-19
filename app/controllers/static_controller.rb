class StaticController < ApplicationController
  def home
    if current_user
      if current_user.is_homeowner?
        redirect_to new_job_posting_path and return
      else
        redirect_to dashboard_path and return
      end
    end
    @job_postings = JobPosting.map_data
  end
end
