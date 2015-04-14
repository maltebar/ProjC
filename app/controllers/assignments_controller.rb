class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def review
    @assignment = Assignment.find(params[:assignment])
  end


  def index
    @assignments = Assignment.all.order('complete')
    @student_assignments = Assignment.where("complete = ? or active = ?", true, true).order('complete')
    respond_with(@assignments)
  end

  def show
    # Assignment.phase_changed do |data|
    #   sse.write(data)
    # end
    @assignment = Assignment.find(params[:id])
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
    if current_phase + 1 < 8
      @assignment.phase = current_phase + 1
    else
      @assignment.phase = 0
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
      params.require(:assignment).permit(:title, :description, :complete, :active, :solution, :phase) 
    end
end
