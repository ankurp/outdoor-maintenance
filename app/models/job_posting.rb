class JobPosting < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :location

  def self.all_postings
    all.map do |j|
      j.attributes.merge({
        location: j.location.coordinates,
        contact_info: j.user.contact_info
      })
    end.to_json
  end
end
