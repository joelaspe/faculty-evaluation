class PublicationController < ApplicationController
    def index
        @publications = Publication.all
    end
    def new
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @publication = @report.publications.new
    end
    def edit
        @report = Report.find(params[:report_id])
        @publication = @report.publications.find(params[:id])
    end
    def create
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @publication = @report.publications.new(publication_params)
    
        if @publication.save
            redirect_to person_report_path(@person, @report)
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @publication = @report.publications.find(params[:id])
        authorize :publication
        if @publication.update(publication_params)
            redirect_to person_path(@person)
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:person_id])
        @report = @person.reports.find(params[:report_id])
        @publication = @report.publications.find(params[:id])
        @publication.destroy
        redirect_to person_path(@person)
    end
        
    
    private
    def publication_params
        params.require(:publication).permit(:type, :year_published, :title, :id, :report_id, :publication_coauthors, :volume, :issue, :pages, :url, :_destroy)
    end
end
