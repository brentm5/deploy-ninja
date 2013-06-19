class Deployment < ActiveRecord::Base
  validates :branch, :commit_sha, presence: true
end
