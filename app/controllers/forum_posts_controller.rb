class ForumPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @forum_post = @forum_thread.forum_posts.build(forum_post_params)
    @forum_post.user = current_user

    if @forum_post.save
      redirect_to @forum_thread, notice: 'Post was successfully created.'
    else
      redirect_to @forum_thread, alert: 'There was an error creating your post.'
    end
  end

  private

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end
end
