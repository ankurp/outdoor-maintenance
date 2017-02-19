class StaticController < ApplicationController
  def home
    if current_user
      redirect_to dashboard_path and return
    end
    @job_postings = JobPosting.includes(:location)
                              .to_json(methods: [
                                :location_coordinates,
                                :request_job_link
                              ])
  end
end
