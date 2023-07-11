class GrantsController < ApplicationController
    def index
        @grants = Grant.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @grant = @report.grants.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @grant = @report.grants.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @grant = @report.grants.new(grant_params)
        
        if @grant.save
            redirect_to person_report_path(@person,@report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:person_id])
        @grant = @report.grants.find(params[:id])
        authorize :grant
        if @grant.update(grant_params)
            redirect_to person_report_path(@person, @report)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @grant = @report.grants.find(params[:id])
        @course.destroy
        redirect_to person_path(@person)
    end
    
    private
    def course_params
         params.require(:grant).permit(:status, :id, :title, :duration, :total_funding, :unm_portion, :
soe_portion, :granscol)
    end
end
