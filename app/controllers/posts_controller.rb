class PostsController < ApplicationController
  def index
    @post = Post.all.order("created_at DESC")
  end

  def new
    # if the post doesnt save then when rendered you dont loose your text
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
# if we save redirect to the new post, else render the new method.
    if @post.save
      redirect_to @post
    else

      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      # else edit the edit form
      render "edit"
    end
  end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  # notice redirect to plural resource - to the index!
  redirect_to root_path
end

  private

  def post_params
    # this way there can be multiple parameters on form but the post only cares about these particular ones-give you so much more conrol on the form it is freaking amazing!
    params.require(:post).permit(:title, :body)
  end
end
