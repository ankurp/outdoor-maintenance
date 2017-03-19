class JobPosting < ApplicationRecord
  belongs_to :user
  belongs_to :job_type
  belongs_to :location
  has_many :job_requests, dependent: :destroy
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def self.default_scope
    where(completed: false)
  end

  def location_coordinates
    self.location.coordinates
  end

  def photo_url
    self.photo.url
  end

  def self.map_data
    includes(:location)
      .to_json(methods: [
        :photo_url,
        :location_coordinates,
        :request_job_link
      ])
  end

  def request_job_link
    "<a rel='nofollow' class='send-request-button' data-method='post' href='/job_requests?job_request[job_posting_id]=#{self.id}'>Send Request To Do The Job</a>"
  end

  def job_type_name
    self.job_type.name
  end

  def location_address
    self.location.address
  end
end
