class DashboardsController < ApplicationController
  def show
    @job_postings = JobPosting.map_data
  end
end
