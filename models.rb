class Deployment < ActiveRecord::Base
  validates :branch, :commit_sha, presence: true

  scope :deploys, lambda { |branch_name| where(branch: branch_name) }

  def self.last_deploy(branch_name)
    deploys(branch_name).last
  end
end
