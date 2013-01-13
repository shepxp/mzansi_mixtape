# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  
  has_attached_file :profile_pic, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" },
                    :default_url => '/images/users/missing_:style.png',
                    url: "/assets/users/:id/:style/:basename.:extention",
                    path: "rails_root/public/assets/users/:id/:style/:basename.:extention"

  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates_attachment_size :profile_pic, less_than: 5.megabytes
  validates_attachment_content_type :profile_pic, content_type: ['image/jpeg', 'image/png']
  
  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
