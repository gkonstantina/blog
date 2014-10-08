class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments, dependent: :destroy
  validates :title, presence:true,
                  length: {minimum: 5}

  after_create :send_article_confirmation_email

  private

  def send_article_confirmation_email
    UserMailer.art_confirm_email(self.user).deliver
    UserMailer.art_notify_email(self.course).deliver
  end
end
