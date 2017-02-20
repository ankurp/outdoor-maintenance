class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to Sustainable Jobs')
  end

  def job_requested(job_request)
    @job_request = job_request
    @requesting_user = job_request.user
    @job_posting = job_request.job_posting
    @job_posting_user = @job_posting.user

    mail(to: @job_posting_user.email, subject: "Request for #{@job_posting.job_type_name}")
  end

end
