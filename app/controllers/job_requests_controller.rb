class JobRequestsController < InheritedResources::Base

  before_action :set_job_request, only: [:show, :destroy]

  def index
    @job_requests = current_user.job_requests
  end

  def show
  end

  def create
    existing_job_request = current_user.job_requests.where(job_request_params).first
    if existing_job_request.present?
      redirect_to job_request_path(existing_job_request) and return
    end

    @job_request = current_user.job_requests.build(job_request_params)

    respond_to do |format|
      if @job_request.save
        format.html do
          redirect_to job_request_path(@job_request),
            notice: "Job request sent for #{@job_request.job_type_name} for address #{@job_request.location_address}."
        end
      else
        format.html { redirect_to job_postings_path, notice: "Error sending request. Try again." }
      end
    end
  end

  def destroy
    @job_request.destroy
    respond_to do |format|
      format.html { redirect_to job_requests_path, notice: 'Job request removed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_request
      @job_request = JobRequest.joins(:job_posting)
                               .joins(:user)
                               .where('job_requests.user_id = ?', current_user.id)
                               .find(params[:id])
    end

    def job_request_params
      params.require(:job_request).permit(:job_posting_id)
    end
end

