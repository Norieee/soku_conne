class MessagesController < ApplicationController
  def index
    @message = Message.new
    @project = Project.find(params[:project_id])
    @messages = @project.messages.includes(:user).order('created_at DESC')
  end

  def create
    @project = Project.find(params[:project_id])
    @message = @project.messages.new(message_params)
    if @message.save
      redirect_to project_messages_path(@project)
    else
      @messages = @project.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :gist_id, :urgency_id, :response_id, :res_type_id,
      :content_id, :sup_content, :status_id, :others, :project_id
    ).merge(user_id: current_user.id)
  end
end