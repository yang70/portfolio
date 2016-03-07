class Project < ActiveRecord::Base
  # update
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
end
