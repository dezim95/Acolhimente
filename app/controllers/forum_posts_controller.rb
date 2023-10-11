class ForumPostsController < ApplicationController
  before_action :set_forum_thread, only: [:create]
  #precisa disso?
  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @forum_post = @forum_thread.forum_posts.build(forum_post_params.merge(user: current_user))

    if @forum_post.save
      redirect_to @forum_thread, notice: 'Post was successfully created.'
    else
      redirect_to @forum_thread, alert: 'Error creating post.'
    end
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end
end
