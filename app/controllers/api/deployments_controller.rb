class Api::DeploymentsController < ApplicationController
  def index
    deployments = Deployment.deploys(params[:tag])
    render json: { deployments: deployments }, status: 200
  end

  def show
    deployment = Deployment.deploys(params[:tag]).last
    render json: { deployment: deployment }, status: 200
  end

  def create
    json = JSON.parse(request.body.read)
    deployment = Deployment.new(json)
    if deployment.save
      render json: { deployment: deployment }, status: 200
    else
      render json: { errors: deployment.errors }, status: 400
    end
  end
end
