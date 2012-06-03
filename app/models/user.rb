class User < ActiveRecord::Base
  attr_accessible :github_name, :has_voted
  has_many :projects

  def available_projects(token)
    GithubProjectLoader::getUserProjects(self.github_name, token)
  end
end
