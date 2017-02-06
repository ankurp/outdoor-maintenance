class JobPosting < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :location


  def self.all_postings
    all.map do |j|
      j.attributes.merge({
        location: {
          latitude: j.location.latitude,
          longitude: j.location.longitude
        },
        user_email: j.user.email
      })
    end.to_json
  end
end
