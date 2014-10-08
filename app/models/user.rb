class User < ActiveRecord::Base
  has_many :articles
  has_and_belongs_to_many :courses

  after_create :send_welcome_mail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def send_welcome_mail
    UserMailer.welcome_email(self).deliver
  end
end
