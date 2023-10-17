class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_forum_thread, except: %i[index new create]

  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
    @forum_post = ForumPost.new
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

  def edit
    authorize @forum_thread # verifica se o usuário tem permissão para editar o tópico
    @forum_thread.forum_posts.build if @forum_thread.forum_posts.empty? # cria um novo post vazio se o tópico não tiver nenhum
  end

  def update
    @forum_thread = ForumThread.find(params[:id])

    if request.patch? && params[:commit] == "Update Forum thread"
      if @forum_thread.update(forum_thread_params)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @forum_thread, notice: 'Thread was successfully updated.' }
        end
      else
        render :edit
      end
    end
  end

  def destroy
    authorize @forum_thread # verifica se o usuário tem permissão para deletar o tópico
    @forum_thread.destroy # remove o tópico e os posts associados do banco de dados
    redirect_to forum_threads_path, notice: 'Thread was successfully deleted.' # redireciona para a página de índice dos tópicos com uma mensagem de sucesso
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body], forum_posts: [:body])
  end
end
