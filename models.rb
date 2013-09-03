class Deployment < ActiveRecord::Base
  validates :tag, :branch, :commit_sha, presence: true

  scope :deploys, lambda { |tag_name| where(tag: tag_name) }

  def self.last_deploy(tag_name)
    deploys(tag_name).last
  end
end
