class Location < ApplicationRecord
  belongs_to :user
  has_many :job_postings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  def address
    [street, suite, city, state, zip_code].reject { |c| c.empty? }.join(', ')
  end

  def coordinates_str
    [self.latitude, self.longitude].join(',')
  end

  def coordinates
    {
      latitude: self.latitude,
      longitude: self.longitude
    }
  end
end
