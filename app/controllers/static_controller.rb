class StaticController < ApplicationController
  def home
    @job_postings = JobPosting.all_postings
    if current_user
      redirect_to job_postings_path and return
    end
  end
end
