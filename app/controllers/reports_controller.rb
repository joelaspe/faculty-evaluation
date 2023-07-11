class ReportsController < ApplicationController
    def index
        @person = Person.find(params[:person_id])
        @reports = @person.reports.all
    end
    def show
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:id])
        @college = College.find(@person.colleges_id)
        @courses = @report.courses.all
        @professional_services = @report.professional_services.all
        @university_services = @report.university_services.all
        @outreach_activities = @report.outreach_activities.all
        @publications = @report.publications.all
        @grants = @report.grants.all
        @mentees = @report.mentees.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.new
        authorize :report
        @report.courses.build
        @report.professional_services.build
        @report.university_services.build
        @report.outreach_activities.build
        @report.publications.build
        @report.grants.build
        @report.mentees.build

    end
    def edit
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:id])
        authorize :report
    end

    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.new(report_params)
        authorize :report
        if @report.save
            respond_to do |format|
                format.html {redirect_to person_path(@person), notice: "Evaluation created successfully." }
            end
        else
            render 'new'
        end
    end

    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:id])
        #authorize :report
        if @report.update(report_params)
            redirect_to person_path(@person)
        else
            render 'edit'
        end
    end

    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:id])
        authorize :report
        @report.destroy
        redirect_to person_path(@person)
    end

    def gen_pdf
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:id])
        @courses = @report.courses.all
        pdf = ReportPdf.new(@person,@report,@courses)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
    end

    private
        def report_params
            params.require(:report).permit(:report_year, :rank, :department, :self_evaluation_text, :future_plans_text, courses_attributes: [:course_number, :course_title, :enrollment, :year, :semester, :evaluation_results, :taught, :report_id, :id, :_destroy], professional_services_attributes: [:id, :title, :description, :type, :report_id, :_destroy], university_services_attributes: [:position, :description, :id, :report_id, :_destroy], outreach_activities_attributes: [:name, :description, :id, :report_id, :_destroy], publications_attributes: [:id, :pubtype, :publication_type, :body, :url, :report_id, :_destroy], grants_attributes: [:status, :id, :title, :duration, :total_funding, :unm_portion, :soe_portion, :granscol, :report_id, :_destroy], mentees_attributes: [:id, :mentee_type, :first_name, :last_name, :middle_name, :banner_id, :study_stage, :expected_graduation, :support_source, :placement, :report_id, :_destroy])
        end
end
