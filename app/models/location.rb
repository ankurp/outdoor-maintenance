class Location < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  def address
    [street, suite, city, state, zip_code].reject { |c| c.empty? }.join(', ')
  end
end
