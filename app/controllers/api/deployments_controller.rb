class Api::DeploymentsController < ApplicationController
  def index
    deployments = Deployment.by_project(params[:project_id])
    render json: { deployments: deployments }, status: 200
  end

  def create
    deployment = Deployment.new(deployment_from_request)
    if deployment.save
      render json: { deployment: deployment }, status: 200
    else
      render json: { errors: deployment.errors }, status: 400
    end
  end

  private

  def deployment_from_request
    request.params[:deployment]
  end
end
