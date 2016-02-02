class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    @comment = Comment.find(params[:id])
    @assignment = Assignment.find(@comment.submission.assignment_id)
    redirect_to assignment_path(@assignment)
  end

  def new
    @comment = Comment.new
    redirect_to :back
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to :back
  end

  def update
    @comment.update(comment_params)
    redirect_to :back
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :line_number, :pair_id)  
    end
end
