require 'github_projects'

class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = Project.order('votes DESC').all
  end

  def new
    @github_projects = current_user.available_projects session[:github_token]
  end
end
