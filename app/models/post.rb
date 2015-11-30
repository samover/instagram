class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  has_attached_file :image, styles: { medium: '600x600>', thumb: '200x200>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, presence: true

  validates :caption, presence: true, length: { minimum: 3 }
end
