class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @course = @report.courses.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @course = @report.courses.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @course = @report.courses.new(course_params)
        
        if @course.save
            redirect_to person_report_path(@person,@report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:person_id])
        @course = @report.courses.find(params[:id])
        authorize :course
        if @course.update(course_params)
            redirect_to person_report_path(@person, @report)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @course = @report.courses.find(params[:id])
        @course.destroy
        redirect_to person_path(@person)
    end
    
    private
    def course_params
         params.require(:course).permit(:course_number, :course_title, :enrollment, :year, :semester, :evaluation_results, :taught)
    end
end
