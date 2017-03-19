class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users_who_recommended = @user.users_who_recommended
    
    unless @user.is_homeowner?
      @job_postings = JobPosting.unscoped
                                .where({
                                  id: @user.job_requests.map(&:job_posting_id),
                                  completed: true
                                })
    end
  end

end
