class Deployment < ActiveRecord::Base
  validates :project, :branch, :commit_sha, presence: true

  def self.by_project(project_name)
    where(project: project_name)
  end
end
