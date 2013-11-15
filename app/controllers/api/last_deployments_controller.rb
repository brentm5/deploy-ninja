class Api::LastDeploymentsController < ApplicationController
  def show
    deployment = Deployment.by_project(params[:project_id]).last
    render json: { deployment: deployment }, status: 200
  end
end
