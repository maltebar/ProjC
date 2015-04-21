class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def studentreview
    @assignment = Assignment.find(params[:assignment])
    @user = User.find(params[:user])
  end

  def adminreview
    @assignment = Assignment.find(params[:assignment])
    @users = User.where.not(admin: true)
  end


  def index
    @assignments = Assignment.all.order('complete')
    @student_assignments = Assignment.where("complete = ? or active = ?", true, true).order('complete')
    respond_with(@assignments)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @other_assignments = Assignment.where.not(id: @assignment.id) 
    if !current_user.admin?
      @submission = Submission.where(user_id: current_user.id, assignment_id: @assignment.id)
      if @submission.empty?
        @submission = Submission.create(user_id: current_user.id, assignment_id: @assignment.id)
      else
        @submission = Submission.find(Submission.where(user_id: current_user.id, assignment_id: @assignment.id))
      end
    end
    if current_user.admin?
      @assignment.update(active: true)
      @other_assignments.each do |assignment|
        assignment.update(active: false)
      end
    end
    respond_with(@assignment)
  end

  def new
    @assignment = Assignment.new
    respond_with(@assignment)
  end

  def edit
  end

  def forward_phase
    @assignment = Assignment.find(params[:id])
    current_phase = @assignment.phase
    if current_phase + 1 < 7
      @assignment.phase = current_phase + 1
    else
      @assignment.phase = 0
    end

    @assignment.save
    if current_phase == 1
      make_random_pairs
    end
    respond_with(@assignment)
  end

  def make_random_pairs
    @assignment = Assignment.find(params[:id])
    @users = User.where.not(admin: true)
    num_pairs = @users.count / 2
    if @users.count.odd?
      @pair = Pair.create(assignment_id: @assignment.id)
      @user = @users.sample
      @users = @users.where.not(id: @user.id)
      @pair << @user
      #add dummy user to pair
    end
    for i in 1..num_pairs
      @user1 = @users.sample
      @users = @users.where.not(id: @user1.id)
      @user2 = @users.sample
      @users = @users.where.not(id: @user2.id)
      @pair = Pair.create(assignment_id: @assignment.id)
      @pair.users << @user1
      @pair.users << @user2
    end
  end

  def backward_phase
    @assignment = Assignment.find(params[:id])
    current_phase = @assignment.phase
    if current_phase - 1 > 0
      @assignment.phase = current_phase - 1
    else
      @assignment.phase = 0
    end
    if current_phase == 2
      @pairs = Pair.where(assignment_id: @assignment.id)
      @pairs.destroy_all
    end
    @assignment.save
    respond_with(@assignment)
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.save
    respond_to do |format|
      if @assignment.update(assignment_params) 
        format.html { redirect_to :action => 'index'}
        format.json { render :show, status: :ok, location: @assignment }
      else 
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @assignment.update(assignment_params)
    respond_to do |format|
      if @assignment.update(assignment_params) 
        format.html { redirect_to :action => 'index'}
        format.json { render :show, status: :ok, location: @assignment }
      else 
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_with(@assignment)
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:title, :description, :complete, :active, :solution, :phase, :pretest, :posttest) 
    end
end
