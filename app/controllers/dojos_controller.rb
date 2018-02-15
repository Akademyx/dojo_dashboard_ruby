class DojosController < ApplicationController
    def index
        @loc = Dojo.all
        render "index"
    end
    def new
        render "new"
    end
    def create
        @dojo = Dojo.new(dojo_params)
        @dojo.save
        redirect_to "/dojos"
    end

    def show
        @dojo = Dojo.find(params[:id])
        @students = Student.query
        puts @students
        render :show
    end

    def edit
        @dojo = Dojo.find(params[:id])
        render "edit"
    end

    def update
        dojos = Dojo.find(params[:id])
        dojos.update(dojo_params)
        redirect_to "/dojos/#{dojos[:id]}"
    end

    def destroy
        dojo = Dojo.find(params[:id]).destroy
        redirect_to "/dojos"
    end
    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street,:city, :state)
    end

    def self.students_of(num)
      self.where("dojo_id = ?", num)
    end
end
