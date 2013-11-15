class Api::LastDeploymentController < ApplicationController
  def index
    deployment = Deployment.by_tag(params[:project_id]).last
    render json: { deployment: deployment }, status: 200
  end
end
