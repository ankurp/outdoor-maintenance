class JobRequest < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting

  delegate :job_type_name, to: :job_posting
  delegate :location_address, to: :job_posting

  after_create :notify_of_job_request

  def mark_as_completed!
    self.update_attribute(:completed, true) && self.job_posting.update_attribute(:completed, true)
  end

  def link_to_recommend
    "<a rel='nofollow' class='send-recommendation-link' data-method='post' href='/recommendations?recommendation[user_id]=#{self.user_id}'>#{self.user.name} <i class='fa fa-thumbs-up'></i></a>?"
  end

  def notify_of_job_request
    UserMailer.job_requested(self).deliver
  end
end
