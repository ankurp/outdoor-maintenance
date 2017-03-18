class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations, dependent: :destroy
  has_many :job_postings, dependent: :destroy
  has_many :job_requests, dependent: :destroy

  has_many :recommendations, dependent: :destroy
  has_many :users_who_recommended,
            through: :recommendations,
            source: :recommender, dependent: :destroy
  has_many :recommended,
            foreign_key: :recommender_id,
            class_name: 'Recommendation', dependent: :destroy
  has_many :recommended_users,
            through: :recommended,
            source: :user, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "100x100#" }, default_url: "/images/medium/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome(self).deliver_now
  end

  def contact_info
    [self.email, self.phone_number].compact.join('\n')
  end

end
