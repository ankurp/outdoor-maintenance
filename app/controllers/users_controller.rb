class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user.is_homeowner
      @users_who_recommended = @user.users_who_recommended
      @job_postings = JobPosting.unscoped
                                .where({
                                  id: @user.job_requests.map(&:job_posting_id),
                                  completed: true
                                })
    end
  end

end
