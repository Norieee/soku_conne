class MessagesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  end
end