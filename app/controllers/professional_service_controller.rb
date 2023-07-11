class ProfessionalServiceController < ApplicationController
    def index
        @professional_services = Professional_service.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @professional_service = @report.professional_services.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @professional_service = @report.professional_services.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @professional_service = @report.professional_services.new(professional_service_params)
        
        if @professional_service.save
            redirect_to person_report_path(@person,@report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        authorize :professional_service
        if @professional_service.update(professional_service_params)
            redirect_to person_report_path(@person, @report)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @professional_service = @report.professional_services.find(params[:id])
        @professional_service.destroy
        redirect_to person_path(@person)
    end
    private
    def professional_service_params
         params.require(:professional_service).permit(:title, :description)
    end
end
