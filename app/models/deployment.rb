class Deployment < ActiveRecord::Base
  validates :tag, :branch, :commit_sha, presence: true

  scope :deploys, lambda { |tag_name| where(tag: tag_name) }
end
