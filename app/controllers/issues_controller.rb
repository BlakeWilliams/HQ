class IssuesController < ApplicationController
  def index
    @issues = Issue.unscoped
    @issues.where('id in (?)', params[:ids]) if params[:ids]
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new params[:issue]

    if @issue.save
      render :show
    else
      render json: {errors: @issue.errors.messages}, status: :unprocessable_entity
    end
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update_attributes params[:issue]
      render :show
    else
      render json: {errors: @issue.errors.messages}, status: :unprocessable_entity
    end
  end
end
