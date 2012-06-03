class GithubProject
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end
end

class GithubProjectLoader
  def self.getUserProjects(github_name, token)
    client = Octokit::Client.new(login: github_name, oauth_token: token)
    client.repositories.map { |project| GithubProject.new project.full_name, project.html_url }
  end
end
