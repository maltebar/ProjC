class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  #before_action :set_complete

  respond_to :html

  def set_complete
    @assignments = Assignment.all
    @assignments.each do |assignment|
      if assignment.display_date < Date.today
        assignment.update(complete: true)
      else
        assignment.update(complete: false)
      end
    end
  end

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

  def change_phase
    @assignment = Assignment.find(2)
    current_phase = @assignment.phase
    @assignment.phase = current_phase + 1
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
