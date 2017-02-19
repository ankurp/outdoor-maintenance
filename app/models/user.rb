class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations
  has_many :job_postings
  has_many :job_requests

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.welcome(self).deliver_now
  end

  def contact_info
    [self.email, self.phone_number].compact.join('\n')
  end

end
