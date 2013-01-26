class ProjectsController < ApplicationController
  def index
    render json: {projects: Project.all}
  end

  def show
    @project = Project.find(params[:id])
    render json: {project: @project}
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes params[:project]
    render json: {project: @project}
  end
end
