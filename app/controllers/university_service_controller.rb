class UniversityServiceController < ApplicationController
    def index
        @university_services = University_service.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @university_service = @report.university_services.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @university_service = @report.university_services.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @university_service = @report.university_services.new(university_service_params)

        if @university_service.save
            redirect_to person_report_path(@person,@report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @university_service = @report.university_services.find(params[:id])
        authorize :university_service
        if @university_service.update(university_service_params)
            redirect_to person_report_path(@person, @report)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @university_service = @report.university_services.find(params[:id])
        @university_service.destroy
        redirect_to person_path(@person)
    end
    
    private
    def university_service_params
        params.require(:university_service).permit(:position, :description)
    end
end
