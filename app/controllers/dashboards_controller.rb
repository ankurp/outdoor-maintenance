class DashboardsController < ApplicationController
  def show
    @job_postings = JobPosting.includes(:location)
                              .to_json(methods: [
                                :location_coordinates,
                                :request_job_link
                              ])
  end
end
