class Deployment < ActiveRecord::Base
  validates :project, :branch, :commit_sha, presence: true

  scope :by_tag, lambda { |project_name| where(project: project_name) }
end
