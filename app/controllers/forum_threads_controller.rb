class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.build
  end

  def create
    @forum_thread = current_user.forum_threads.build(forum_thread_params)
    @forum_thread.forum_posts.first.user_id = current_user.id
    if @forum_thread.save
      redirect_to @forum_thread, notice: 'Thread was successfully created.'
    else
      render :new
    end
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
  end
end
