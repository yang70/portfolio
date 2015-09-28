class Comment < ActiveRecord::Base
  validates :content, length: { minimum: 2 }

  belongs_to :user
  belongs_to :article
end
