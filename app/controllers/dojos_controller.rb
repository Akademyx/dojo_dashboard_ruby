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

    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street,:city, :state)
    end
end
