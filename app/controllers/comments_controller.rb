class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]


  # POST /comments
  def create
    @new_comment = @event.comments.builds(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @event, notice: t('controllers.comments.created')
    else
      render 'events/show', alert: t('controllers.comments.error')
    end
  end

  def destroy
    message = {notice: t('controllers.comments.destroyed')}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: t('controllers.comments.error')}
    end

    redirect_to @event, message
  end

  ## DELETE /comments/1
  #def destroy
  #  @comment.destroy
  #  redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  #end

  private

  def det_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
    #params.fetch(:comment, {})
  end
end
