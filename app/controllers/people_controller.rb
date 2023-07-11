class PeopleController < ApplicationController
    def index
        @people = Person.all
    end
    def show
        @person = Person.find(params[:id])
    end
    def new
        @person = Person.new
        authorize :person
    end
    def edit
        @person = Person.find(params[:id])
        authorize :person
    end
    def create
   # render plain: params[:person].inspect
        @person = Person.new(person_params)
        @person.add_role(:user)
        authorize :person

        if @person.save
            flash[:notice] = "Successfully created person."
            redirect_to @person
        else
            render 'new'
        end
    end
    def update
        @person = Person.find(params[:id])
        authorize :person
        if @person.update(person_params)
            redirect_to @person
        else
            render 'edit'
        end
    end
    def destroy
        @person = Person.find(params[:id])
        authorize :person
        @person.destroy

        redirect_to people_path
    end
    private
        def person_params
            params.require(:person).permit(:first_name, :last_name, :net_id, :banner_id, :position, :colleges_id)
        end
end
