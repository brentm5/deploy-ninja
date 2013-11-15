class Api::DeploymentsController < ApplicationController
  def index
    deployments = Deployment.by_tag(params[:project_id])
    render json: { deployments: deployments }, status: 200
  end

  def create
    deployment = Deployment.new(request_json)
    if deployment.save
      render json: { deployment: deployment }, status: 200
    else
      render json: { errors: deployment.errors }, status: 400
    end
  end

  private

  def request_json
    @request_json ||= JSON.parse(request.body.read)
  end
end
