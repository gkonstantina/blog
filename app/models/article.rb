class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :comments, dependent: :destroy
  validates :title, presence:true,
                  length: {minimum: 5}
end
