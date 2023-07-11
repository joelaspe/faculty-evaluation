class OutreachActivityController < ApplicationController
    def index
        @outreach_activities = Outreach_activity.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @outreach_activity = @report.outreach_activities.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @outreach_activity = @report.outreach_activities.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @outreach_activity = @report.outreach_activities.new(outreach_activity_params)

        if @outreach_activity.save
            redirect_to person_report_path(@person, @report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @outreach_activity = @report.outreach_activities.find(params[:id])
        authorize :outreach_activity
        if @outreach_activity.update(outreach_activity_params)
            redirect_to person_report_path(@person, @report)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @outreach_activity = @report.outreach_activities.find(params[:id])
        @outreach_activity.destroy
        redirect_to person_path(@person)
    end
    
    private
    def outreach_activity_params
        params.require(:outreach_activity).permit(:name, :description)
    end
end
