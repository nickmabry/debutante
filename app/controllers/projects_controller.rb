require 'github_projects'

class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = Project.order('votes DESC').all
  end

  def available_projects
    @github_projects = current_user.available_projects session[:github_token]
  end

  def new
    @project = Project.new(title: params[:project_name], url: params[:project_url])
  end

  def create
    @project = Project.new(title: params[:title], url: params[:url], description: params[:project][:description], short_description: params[:project][:description].slice(0..140))
    @project.user = current_user
    if !@project.save
      redirect_to({action: :index}, alert: "You have already submitted a project this round. Feel free to submit this one next week!")
    else
      redirect_to action: :index
    end
  end

  def vote
    if current_user.has_voted
      redirect_to({action: :index}, alert: "You have already voted this round. Feel free to vote again next week!")
    else
      Project.transaction do
        @project = Project.find(params[:id])
        @project.votes += 1
        current_user.has_voted = true
        @project.save
        current_user.save
      end
      redirect_to action: :index
    end
  end
end
