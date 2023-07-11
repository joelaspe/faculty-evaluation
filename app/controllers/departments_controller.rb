class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.where(college: params[:college_id])
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)
    @department.college = College.find(params[:college_id])
    render json: { success: @department.save, department: @department }
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    render json: { success: @department.update({name: params[:name]}) }
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    render json: { success: @department.destroy }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.permit(:name, :college_id, :id)
    end
end
