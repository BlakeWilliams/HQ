class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new params[:project]
    if @project.save
      render json: {project: @project}
    else
      render json: {errors: @project.errors.messages}, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes params[:project]
      render json: {project: @project}
    else
      render json: {errors: @project.errors.messages}, status: :unprocessable_entity
    end
  end
end
