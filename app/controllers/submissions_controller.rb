class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @submissions = Submission.all
    respond_with(@submissions)
  end

  def show
    @submission = Submission.find(params[:id])
    @assignment = Assignment.find(@submission.assignment_id)
    if @assignment.complete?
      redirect_to root_path
    else
      redirect_to assignment_path(@assignment)
    end
  end

  def new
    @submission = Submission.new
    respond_with(@submission)
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.save
    respond_with(@submission)
  end

  def update
    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    @submission.destroy
    respond_with(@submission)
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:content, :pretest, :posttest)  
    end
end
