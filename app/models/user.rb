class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations
  has_many :job_postings
  has_many :job_requests

  has_many :recommendations
  has_many :users_who_recommended,
            through: :recommendations,
            source: :recommender
  has_many :recommended,
            foreign_key: :recommender_id,
            class_name: 'Recommendation'
  has_many :recommended_users,
            through: :recommended,
            source: :user

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome(self).deliver_now
  end

  def contact_info
    [self.email, self.phone_number].compact.join('\n')
  end

end
