class Deployment < ActiveRecord::Base
  validates :tag, :branch, :commit_sha, presence: true

  scope :by_tag, lambda { |tag_name| where(tag: tag_name) }
end
