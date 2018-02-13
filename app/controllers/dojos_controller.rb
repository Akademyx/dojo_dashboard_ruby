class DojosController < ApplicationController
    def index
        @loc = Dojo.all
        render "index"
    end
end
