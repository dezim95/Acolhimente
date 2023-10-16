class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_forum_thread, except: %i[index new create]

  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
    @comment = Comment.new
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.build
  end

  def create_comment
    @forum_thread = ForumThread.find(params[:id])
    @comment = @forum_thread.comments.build(params.require(:comment).permit(:body))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @forum_thread, notice: 'Comment was successfully created.'
    else
      render :show
    end
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

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
  end
end
