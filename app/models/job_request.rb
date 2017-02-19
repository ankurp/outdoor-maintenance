class JobRequest < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting

  delegate :job_type_name, to: :job_posting
  delegate :location_address, to: :job_posting

  def mark_as_completed!
    self.update_attribute(:completed, true) && self.job_posting.update_attribute(:completed, true)
  end
end
