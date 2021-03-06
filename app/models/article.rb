class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments # as: :commentable
  mount_uploader :picture, PictureUploader
end
