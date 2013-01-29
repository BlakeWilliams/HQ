class IssuesController < ApplicationController
  def index
    @issues = Issue.unscoped
    @issues.where('id in (?)', params[:ids]) if params[:ids]
    render json: {issues: @issues}
  end
end
