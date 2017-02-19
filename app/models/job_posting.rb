class JobPosting < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :location
  has_many :job_requests

  def self.default_scope
    where(completed: false)
  end

  def location_coordinates
    self.location.coordinates
  end

  def request_job_link
    "<a rel='nofollow' class='send-request-button' data-method='post' href='/job_requests?job_request[job_posting_id]=#{self.id}'>Send Request To Job</a>"
  end

  def job_type_name
    self.job_type.name
  end

  def location_address
    self.location.address
  end
end
