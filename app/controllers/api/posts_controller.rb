class Api::PostsController < ApplicationController
  before_action :set_api_post, only: %i[ show update destroy ]

  # GET /api/posts
  def index
    @api_posts = Api::Post.all

    render json: @api_posts
  end

  # GET /api/posts/1
  def show
    render json: @api_post
  end

  # POST /api/posts
  def create
    @api_post = Api::Post.new(api_post_params)

    if @api_post.save
      render json: @api_post, status: :created, location: @api_post
    else
      render json: @api_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/posts/1
  def update
    if @api_post.update(api_post_params)
      render json: @api_post
    else
      render json: @api_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/posts/1
  def destroy
    @api_post.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_post
      @api_post = Api::Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_post_params
      params.require(:api_post).permit(:title, :content)
    end
end
