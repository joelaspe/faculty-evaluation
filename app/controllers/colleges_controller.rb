class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.all
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
  end

  # GET /colleges/new
  def new
    @college = College.new
  end

  # GET /colleges/1/edit
  def edit
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(college_params)
    render json: { success: @college.save, college: @college }
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    render json: { success: @college.update(college_params) }
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    render json: { success: @college.destroy }

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.permit(:name)
    end
end
